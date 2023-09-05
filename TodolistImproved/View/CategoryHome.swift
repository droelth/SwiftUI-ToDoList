//
//  CategoryHome.swift
//  TodolistImproved
//
//  Created by Berkay Sutlu on 5.09.2023.
//

import SwiftUI

struct CategoryHome: View {
    @StateObject var categoryViewModel = catVM()
    @Binding var doneTasksNo : Int
    @Binding var totalTasksNo : Int
    @State var progress: Double = 0.0
    @Binding var categoryName: String
    @State var bgColor: UIColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1.0)
    
    var body: some View {
        VStack {
            HStack {
                Text(categoryName).font(.title2).foregroundColor(.white).fontWeight(.bold)
                Spacer()
            }.padding(20).padding(.vertical,20)
            HStack {
                Text("\(doneTasksNo) of \(totalTasksNo)").font(.title3).fontWeight(.medium).foregroundColor(.white)
                Spacer()
                ZStack {
                    Circle() // Background Circle
                        .trim(from: 0.0, to: 1.0)
                        .stroke(Color.gray, lineWidth: 10)
                        .frame(width: 50, height: 50)
                        .rotationEffect(.degrees(-90))
                    Circle() // Progress Circle
                        .trim(from: 0.0, to: CGFloat(progress))
                        .stroke(Color.white, lineWidth: 10)
                        .frame(width: 50, height: 50)
                        .rotationEffect(.degrees(-90))
                }
            }.padding(20)
            Spacer()
        }.frame(width: 200,height: 200).background(Color(bgColor)).cornerRadius(30).onAppear{
            bgColor = categoryViewModel.randomColor()
            progress = categoryViewModel.ProgressCalc(doneTasksNo, totalTasksNo)
        }
        
    }
   
    
}

//struct CategoryHome_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoryHome()
//    }
//}
