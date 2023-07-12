//
//  EditProductViewModel.swift
//  MvvmTutorial
//
//  Created by Cristian Cris on 11/07/23.
//

import Foundation

class EditProductViewModel : ObservableObject {
    let repository: ProductRepositoryProtocol
    
    @Published var name: String = ""
    @Published var priceText: String = ""
    @Published var detail: String = ""
    
    init(repository: ProductRepositoryProtocol){
        self.repository = repository
    }
    
    func save() {
        _ = self.repository.update(product: Product(name: name, detail: detail, price: priceText.toDouble()))
    }
    
    func load(product: Product) {
        name = product.name
        priceText = String(format: "%.2f", product.price)
        detail = product.detail
    }
}
