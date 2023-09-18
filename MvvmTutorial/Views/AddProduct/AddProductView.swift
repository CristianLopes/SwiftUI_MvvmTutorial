//
//  AddProductView.swift
//  MvvmTutorial
//
//  Created by Cristian Cris on 11/07/23.
//

import SwiftUI
import CoreData
struct AddProductView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var vm: AddProductViewModel = AddProductViewModel(repository: ProductRepository(storage: PersistenceStorage(container: NSPersistentContainer(name: "CoreDataContainer"))))
    
    let mercury = Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1))
    
    var body: some View {
            VStack (spacing: 20) {
                TextField("Name", text: $vm.name)
                    .font(.headline)
                    .padding(.leading)
                    .frame(height: 55)
                    .background(mercury)
                    .cornerRadius(10)
                
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
            .navigationTitle("Add Product")
            .padding()
        }
}

struct AddProductView_Previews: PreviewProvider {
    static var previews: some View {
        AddProductView()
    }
}
