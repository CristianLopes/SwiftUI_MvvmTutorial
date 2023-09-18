//
//  AddProductNameView.swift
//  MvvmTutorial
//
//  Created by Cristian Cris on 21/07/23.
//

import SwiftUI
import AVFoundation
import os.log

struct AddProductViewV2: View {
    @State var name: String = ""
    @State var priceText: String = ""
    @State var description: String = ""
    
    var body: some View {
        ZStack {
            
            RadialGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)), Color(#colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1))]),
                           center: .topLeading,
                           startRadius: 5,
                           endRadius: UIScreen.main.bounds.height)
            
            VStack {
                Spacer()
                
                addPhotoSection
            
                Spacer()
                Spacer()
            }
            .padding(.horizontal)
        }
    }

    private var addPhotoSection: some View {
        VStack{
            Text("Add some photo.")
                .font(.largeTitle)
                .foregroundColor(.white)
            
            
            
            
            TextField("Product name here...", text: $name)
                .font(.headline)
                .frame(height: 55)
                .padding(.horizontal)
                .background(.white)
                .cornerRadius(10)
        }
    }
    
    private var addNameSection: some View {
        VStack{
            Text("What is the product name?")
                .font(.largeTitle)
                .foregroundColor(.white)
            
            Text("This information should be exiting!")
                .foregroundColor(.gray)
            
            TextField("Product name here...", text: $name)
                .font(.headline)
                .frame(height: 55)
                .padding(.horizontal)
                .background(.white)
                .cornerRadius(10)
        }
    }
    
    private var addPriceSection: some View {
        VStack{
            Text("What is the product price?")
                .font(.largeTitle)
                .foregroundColor(.white)
            
            TextField("Product price...", text: $priceText)
                .font(.headline)
                .frame(height: 55)
                .padding(.horizontal)
                .background(.white)
                .cornerRadius(10)
        }
    }
    
    private var addDescriptionSection: some View {
        VStack{
            Text("What is the description?")
                .font(.largeTitle)
                .foregroundColor(.white)
            
            TextEditor(text: $name)
                .font(.headline)
                .frame(height: 200)
                .padding(.horizontal)
                .background(.white)
                .cornerRadius(10)
        }
    }
    
}

struct AddProductNameView_Previews: PreviewProvider {
    static var previews: some View {
        AddProductViewV2()
    }
}
