//
//  catVM.swift
//  TodolistImproved
//
//  Created by Berkay Sutlu on 8.09.2023.
//

import SwiftUI

class catVM: ObservableObject {
    
    func ProgressCalc(_ doneTaskNo: Int, _ totalTaskNo: Int) -> Double{
        return Double(doneTaskNo) / Double(totalTaskNo)
    }
    
    
    func randomColor() -> UIColor {
        let red = CGFloat.random(in: 0.0...1.0)
        let green = CGFloat.random(in: 0.0...1.0)
        let blue = CGFloat.random(in: 0.0...1.0)
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    @Published var myCategories = [Category(name: "Work",
                                        doneTasks: [Task(name: "Get the documents", isCompleted: true), Task(name: "Bring the documents", isCompleted: true)],
                                        tasks: [Task(name: "Get the documents", isCompleted: true), Task(name: "Bring the documents",isCompleted: true), Task(name: "Close the eyes")]),
                               Category(name: "School",
                                        doneTasks: [Task(name: "Get the documents", isCompleted: true), Task(name: "Bring the documents", isCompleted: true)],
                                        tasks: [Task(name: "Get the documents", isCompleted: true), Task(name: "Bring the documents", isCompleted: true), Task(name: "Close the eyes")])]
    
}
