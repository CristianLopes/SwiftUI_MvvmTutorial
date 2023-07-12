//
//  AddProductViewModel.swift
//  MvvmTutorial
//
//  Created by Cristian Cris on 11/07/23.
//

import Foundation

class AddProductViewModel : ObservableObject {
    let repository: ProductRepositoryProtocol
    
    var name: String = ""
    var priceText: String = ""
    var detail: String = ""
    
    init(repository: ProductRepositoryProtocol){
        self.repository = repository
    }
    
    func save() {
        _ = self.repository.add(product: Product(name: name, detail: detail, price: priceText.toDouble()))
        
        name = ""
        priceText = ""
        detail = ""
    }
}
