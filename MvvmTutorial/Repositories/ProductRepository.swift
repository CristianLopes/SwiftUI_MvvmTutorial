//
//  ProductRepository.swift
//  MvvmTutorial
//
//  Created by Cristian Cris on 11/07/23.
//

import Foundation
import CoreData

enum RepositoryErrors: Error {
    case entityNotFound
}

protocol ProductRepositoryProtocol {
    func add(product: Product) -> Bool
    func update(product: Product) -> Bool
    func fetch() -> [Product]
    func delete(product: Product) -> Bool
}

class ProductRepository : ProductRepositoryProtocol {
    let storage: PersistenceStorage
    
    init(storage: PersistenceStorage) {
        self.storage = storage
    }
    
    func add(product: Product) -> Bool {
        let productEntity: ProductEntity = ProductEntity(context: self.storage.container.viewContext)
        
        productEntity.name = product.name
        productEntity.detail = product.detail
        productEntity.price = product.price
        
        save()
        return true
    }
    
    func update(product: Product) -> Bool {
        do {
            let entity = try findByName(name: product.name)
            entity.detail = product.detail
            entity.price = product.price
            save()
            return true
        }catch let error {
            print("ERROR UPDATING DATA. \(error)")
            return false
        }
    }
    
    func fetch() -> [Product] {
        let request = NSFetchRequest<ProductEntity>(entityName: "ProductEntity")
        
        do {
            let entities = try self.storage.container.viewContext.fetch(request)
            return entities.map { productEntity in
                return Product(name: productEntity.name ?? "", detail: productEntity.detail ?? "", price: productEntity.price)
            }
        } catch let error {
            print("ERROR FETCHING DATA. \(error)")
        }
        
        return []
    }
    
    private func findByName(name: String) throws -> ProductEntity {
        let fetchRequest = ProductEntity.fetchRequest()
        fetchRequest.fetchLimit = 1
        fetchRequest.predicate = NSPredicate(format: "name LIKE %@", name)
        do {
            guard let entity = try self.storage.container.viewContext.fetch(fetchRequest).first else {
                print("Entity not found.")
                throw RepositoryErrors.entityNotFound
            }
            
            return entity
        } catch let error {
            print("ERROR FINDING PRODUCT. \(error)")
        }
        
        throw RepositoryErrors.entityNotFound
    }
    
    func delete(product: Product) -> Bool {
        
        
        do{
            let entity = try findByName(name: product.name)
            
            self.storage.container.viewContext.delete(entity)
            save()
        }catch let error {
            print("ERROR Deleting DATA. \(error)")
        }
        
        return true
    }
    
    func save() {
        do {
            try self.storage.container.viewContext.save()
        } catch let error {
            print("ERROR SAVING DATA. \(error)")
        }
    }
}
