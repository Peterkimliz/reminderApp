//
//  RemindersApp.swift
//  Reminders
//
//  Created by Apple on 29/09/2026.
//

import SwiftUI
import SwiftData

@main
struct RemindersApp: App {
    var body: some Scene {
        WindowGroup {
            HomeScreen()
        }.modelContainer(for: CategoryItem.self)
        
    }
}
