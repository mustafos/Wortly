//
//  Category.swift
//  Yuvka
//
//  Created by Mustafa Bekirov on 27.11.2024.
//

import Foundation

enum Category: String, CaseIterable, Identifiable {
    case all = "All"
    case Dinner = "Dinner"
    case Lunch = "Lunch"
    case Snacks = "Snacks"
    case Breakfast = "Breakfast"
    case Vegetarian = "Vegetarian"
    case Nonvegetarian = "Nonvegetarian"
    
    var id: String { self.rawValue }
}
