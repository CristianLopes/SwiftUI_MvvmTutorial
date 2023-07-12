//
//  ContentView.swift
//  MvvmTutorial
//
//  Created by Cristian Cris on 11/07/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var vm: AddProductViewModel = AddProductViewModel()
    
    var body: some View {
        VStack (spacing: 20) {
            Text("Add Product")
                .font(.largeTitle)
                .bold()
            
            TextField("Name", text: $vm.name)
                .font(.headline)
                .padding(.leading)
                .frame(height: 55)
                .background(.tertiary)
                .cornerRadius(10)
            
            TextField("Price", text: $vm.price)
                .font(.headline)
                .padding(.leading)
                .frame(height: 55)
                .background(.tertiary)
                .cornerRadius(10)
            
            TextField("Detail", text: $vm.detail)
                .font(.headline)
                .padding(.leading)
                .frame(height: 55)
                .background(.tertiary)
                .cornerRadius(10)
            
            
            Button {
                vm.save()
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
