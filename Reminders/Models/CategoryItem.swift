//
//  CategoryItem.swift
//  Reminders
//
//  Created by Apple on 01/10/2026.
//

import SwiftUI
import SwiftData
@Model
class CategoryItem{
    
    var name:String
    var colorCode:String
    @Relationship(deleteRule: .cascade)
    var reminders:[ReminderItem] = []
    
    init(name: String, colorCode: String) {
        self.name = name
        self.colorCode = colorCode
    }
    
    
    static let listItems = [
        CategoryItem(name: "Test", colorCode: "white"),
        CategoryItem(name: "test two", colorCode: "white")
    ]
}
