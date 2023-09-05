//
//  Category.swift
//  TodolistImproved
//
//  Created by Berkay Sutlu on 5.09.2023.
//

import SwiftUI

import UIKit

struct Category: Identifiable {
    var id = UUID()
    var name: String
    var doneTasks: [Task]
    var tasks: [Task]
}


