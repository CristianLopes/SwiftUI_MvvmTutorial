//
//  PersistenceStorage.swift
//  MvvmTutorial
//
//  Created by Cristian Cris on 11/07/23.
//

import Foundation
import CoreData

class PersistenceStorage {
    let container: NSPersistentContainer
    init(container: NSPersistentContainer) {
        self.container = container
        self.container.loadPersistentStores { (description, error) in
            if let error = error {
                print("ERROR LOADING CORE DATA. \(error)")
            } 
        }
    }
}
