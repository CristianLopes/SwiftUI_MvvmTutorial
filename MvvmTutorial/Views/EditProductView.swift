//
//  EditProductView.swift
//  MvvmTutorial
//
//  Created by Cristian Cris on 11/07/23.
//

import SwiftUI
import CoreData



struct EditProductView: View {
    @Environment(\.presentationMode) var presentationMode
    let mercury = Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1))
    let product: Product
    
    init(product: Product) {
        self.product = product
    }
    
    @ObservedObject var vm: EditProductViewModel = EditProductViewModel(repository: ProductRepository(storage: PersistenceStorage(container: NSPersistentContainer(name: "CoreDataContainer"))))
    
    var body: some View {
        VStack (spacing: 20) {
            Text("Edit Product")
                .font(.largeTitle)
                .bold()
            
            TextField("Name", text: $vm.name)
                .font(.headline)
                .foregroundColor(.gray)
                .padding(.leading)
                .frame(height: 55)
                .background(.tertiary)
                .cornerRadius(10)
                .disabled(true)
            
            TextField("Price", text: $vm.priceText)
                .font(.headline)
                .padding(.leading)
                .frame(height: 55)
                .background(mercury)
                .cornerRadius(10)
            
            TextField("Detail", text: $vm.detail)
                .font(.headline)
                .padding(.leading)
                .frame(height: 55)
                .background(mercury)
                .cornerRadius(10)
            
            
            Button {
                vm.save()
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Save")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .cornerRadius(10)
            }
            
            Spacer()
        }
        .padding()
        .onAppear(){
            vm.load(product: self.product)
        }
    }
}

struct EditProductView_Previews: PreviewProvider {
    static var previews: some View {
        EditProductView(product: Product(name: "Product 1", detail: "Detail of product", price: 250))
    }
}
