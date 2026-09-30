//
//  ListItem.swift
//  Reminders
//
//  Created by Apple on 29/09/2026.
//

import SwiftUI
import SwiftData
@Model
class ListItem{
    
    var name:String
    var colorCode:String
    @Relationship(deleteRule: .cascade)
    var reminders:[ReminderItem] = []
    
    init(name: String, colorCode: String) {
        self.name = name
        self.colorCode = colorCode
    }
}
