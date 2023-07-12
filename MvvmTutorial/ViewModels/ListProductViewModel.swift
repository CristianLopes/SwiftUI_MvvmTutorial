//
//  ListProductViewModel.swift
//  MvvmTutorial
//
//  Created by Cristian Cris on 11/07/23.
//

import Foundation

class ListProductViewModel : ObservableObject {
    let repository: ProductRepositoryProtocol
    
    @Published var products: [Product] = []
    
    init(repository: ProductRepositoryProtocol){
        self.repository = repository
    }
    
    func load() {
        products = self.repository.fetch()
    }
    
    func delete(indexSet: IndexSet) {
        guard let index = indexSet.first else{
            return
        }
        
        let product = products[index]
        _ = repository.delete(product: product)
    }
}
