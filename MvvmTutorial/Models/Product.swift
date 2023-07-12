//
//  Product.swift
//  MvvmTutorial
//
//  Created by Cristian Cris on 11/07/23.
//

import Foundation

struct Product : Identifiable {
    let id: String = UUID().uuidString
    
    let name: String
    let detail: String
    let price: Double
}
