//
//  ReminderCard.swift
//  Reminders
//
//  Created by Apple on 30/09/2026.
//

import SwiftUI



struct SelectedReminderCell: View {
    @Binding var selectedReminder:ReminderItem

    var body: some View {
        HStack(alignment: .top){
            Image(systemName: selectedReminder.isCompleted ? "largecircle.fill.circle" : "circle")
                .padding([.trailing],3)
                .foregroundStyle(selectedReminder.isCompleted ?.blue:.gray)
                .onTapGesture {
                    selectedReminder.isCompleted.toggle()
                }
            
            
            VStack(alignment: .leading){
                TextField("Name", text: $selectedReminder.name,axis: .vertical)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .textFieldStyle(.plain)
                
                TextField("Add Note", text: $selectedReminder.note,axis: .vertical)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .foregroundStyle(.gray)
                    .padding([.top],2)
                
                
                
            }
            
            
        Image(systemName: "info.circle")
    }
    .frame(maxWidth: .infinity)
    .listRowSeparator(.hidden)
    .padding()
    .overlay(
        RoundedRectangle(cornerRadius: 20)
        .stroke(.gray.opacity(0.2),lineWidth: 1)
        .shadow(color:.gray,radius: 0.1))
    }
    
    
    
}

#Preview {
    SelectedReminderCell(selectedReminder: .constant(CategoryItem.listItems[0].reminders[0]))
}
