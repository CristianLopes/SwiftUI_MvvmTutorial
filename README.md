# **SwiftUI + CoreData + Repository Pattern + Mvvm**

This repository is focused on giving a brief introduction to **Local Persistence using CoreData**, and of course, using **MVVM**. 

**MVVM (Model-View-ViewModel)**
**Model**
The model represents your data and business logic. It should be independent of the user interface.

**View**
The View is responsible for displaying the user interface and capturing user input. 
Views should be as dumb as possible, meaning they shouldn't contain much logic.

**ViewModel**
The ViewModel acts as an intermediary between the Model and the View.
It holds the presentation logic and prepares the data that the View needs to display.
The ViewModel is responsible for transforming and formatting the data from the Model into a format that the View can easily display.


**Core Data**
Core Data is an object-graph and persistence framework that allows you to work with data in a more high-level, object-oriented manner.


**Repository Pattern**
The Repository Pattern is used to abstract the data access layer from the rest  of the application. 
It provides a clean API for the application to interact with data sources, such as databases or even web services.


**About Project**
It's a simple **CRUD** application. 

Our application will have a folder separation. 
We will have Models, Views, ViewModels, and Repositories folders. 

In Models, we have the Product Model:
```swift
struct Product : Identifiable {
    let id: String = UUID().uuidString
    
    let name: String
    let detail: String
    let price: Double
}
```

In Repositories, we will have three files...
**PersistenceStorage**: It is just a core data container initialization.
```swift
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
```

**ProductRepository**: That's who mediates interactions with data sources.
There we will usually have methods like add, remove, fetch, find, update, and things like these. 

We have our protocol like this.
```swift
protocol ProductRepositoryProtocol {
    func add(product: Product) -> Bool
    func update(product: Product) -> Bool
    func fetch() -> [Product]
    func delete(product: Product) -> Bool
}
```

**Why do you use Protocol?**
Simple, maintainability, flexibility and testability

Let's think, maybe one day Core Data won't meet the requirements, so to replace will just create another one that implements the same protocol and changes in the injection.

**And the ViewModels**
We have three view models. 
AddProductViewModel, ListProductViewModel, and EditProductViewModel. 

I will show just the AddProductViewModel to clarify.
Here on this ViewModel, we can see that the user can do just one thing on this view, that is add a new product.

Another thing that I said is about protocol injection, if one day it changes, I don't need to change anything on this ViewModel because I don`t have a reference to CoreData directly. 
```swift
class AddProductViewModel: ObservableObject {
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
```

Here is our result.

![Products_gif](https://github.com/CristianLopes/SwiftUI_MvvmTutorial/assets/13282242/3bbeac70-25b4-4daf-9497-0d2e6e8879a0)

Thank you guys, I hope this simple code could save someone's time.

**Keep Learning**




