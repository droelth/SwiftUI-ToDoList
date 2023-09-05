//
//  CategoryAddView.swift
//  TodolistImproved
//
//  Created by Berkay Sutlu on 7.09.2023.
//

import SwiftUI

struct CategoryAddView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var myCategories: [Category]   
    @State var categoryName: String = ""
    var body: some View {
        ZStack {
            
            VStack{
                TextField("Category Name", text: $categoryName).padding(10).foregroundColor(.white).accentColor(.white).autocorrectionDisabled()
                
                Button {
                    if categoryName.isEmpty != true {
                        myCategories.append(Category(name: categoryName, doneTasks: [], tasks: []))
                        presentationMode.wrappedValue.dismiss()
                    }
                } label: {
                    Text("Add Category").foregroundColor(.white).padding(10).cornerRadius(50)
                }

            }.frame(height: 300)
        }.background(.blue).edgesIgnoringSafeArea(.all)
    }
}

