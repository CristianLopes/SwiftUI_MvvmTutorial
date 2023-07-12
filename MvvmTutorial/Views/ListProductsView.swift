//
//  ListProductsView.swift
//  MvvmTutorial
//
//  Created by Cristian Cris on 11/07/23.
//

import SwiftUI
import CoreData

struct ListProductsView: View {
    @Environment(\.scenePhase) var scenePhase
    
    @ObservedObject var vm: ListProductViewModel = ListProductViewModel(repository: ProductRepository(storage: PersistenceStorage(container: NSPersistentContainer(name: "CoreDataContainer"))))
    
    var body: some View {
        NavigationView {
            VStack {
                
                if vm.products.count == 0 {
                    Text("Empty List")
                } else {
                    List {
                        ForEach(vm.products) { product in
                            NavigationLink(destination: EditProductView(product: product)) {
                                
                                VStack(alignment: .leading, spacing: 10) {
                                    HStack {
                                        Text(product.name)
                                        Spacer()
                                        Text(String(format: "%.2f", product.price))
                                    }
                                    Text(product.detail)
                                }
                                    
                            }
                        }
                        .onDelete(perform: vm.delete)
                    }
                    .listStyle(.inset)
                }
            
                Spacer()
                HStack {
                    Spacer()
                    NavigationLink(destination: AddProductView()) {
                        VStack {
                            Circle()
                                .fill(.white)
                                .frame(width: 75, height: 75)
                                .shadow(radius: 10)
                                .overlay(
                                    Image(systemName: "plus")
                                        .font(.largeTitle)
                            )
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .onAppear(){
                vm.load()
            }
            .navigationTitle("Products")
            .navigationBarItems( trailing: NavigationLink(destination: {
                AddProductView()
            }, label: {
                Image(systemName:"plus")
                    .font(.largeTitle)
            }))
        }
    }
}

struct ListProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ListProductsView()
    }
}
