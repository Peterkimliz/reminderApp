//
//  ReminderItem.swift
//  Reminders
//
//  Created by Apple on 29/09/2026.
//

import SwiftUI
import SwiftData

@Model
class ReminderItem{
    var name:String
    var note:String
    var isCompleted:Bool
    var reminderDate:Date?
    var reminderTime:Date?
    var listItem:CategoryItem?
    
    
    init(
        name: String,
        note: String = "",
        isCompleted: Bool=false,
        reminderDate: Date? = nil,
        reminderTime: Date? = nil,
        listItem: CategoryItem? = nil
    ) {
        self.name = name
        self.note = note
        self.isCompleted = isCompleted
        self.reminderDate = reminderDate
        self.reminderTime = reminderTime
        self.listItem = listItem
    }
    
    
}
