//
//  ReminderCard.swift
//  Reminders
//
//  Created by Apple on 30/09/2026.
//

import SwiftUI



struct SelectedReminderCell: View {
    
    
    @Binding var name :String
    @Binding var note:String
    var body: some View {
        HStack(alignment: .top){
            Image(systemName: "circle")
                .padding([.trailing],3)
            
            
            VStack(alignment: .leading){
                TextField("Name", text: $name,axis: .vertical)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .textFieldStyle(.plain)
                
                TextField("Add Note", text: $note,axis: .vertical)
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
    SelectedReminderCell(name: .constant(""), note: .constant(""))
}
