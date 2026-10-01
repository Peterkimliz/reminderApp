//
//  ListDetailScreen.swift
//  Reminders
//
//  Created by Apple on 30/09/2026.
//

import SwiftUI
import SwiftData

struct ListDetailScreen: View {
    var category: CategoryItem
    @State private var showDialog:Bool = false
    @State private var isEditting:Bool = false
    @State private var selectedReminder:ReminderItem
    
    
    init(category: CategoryItem) {
        self.category = category
        self.selectedReminder = ReminderItem(name: "",note: "")
        
    }
    
    var body: some View {
        ZStack(){
            List{
                Text(category.name.capitalized)
                    .font(.system(size:32))
                    .bold()
                    .listRowSeparator(.hidden)
                
            
                    ForEach(category.reminders) {item in
                        if  selectedReminder.persistentModelID == item.persistentModelID {
                            
                            
                            SelectedReminderCell(selectedReminder: $selectedReminder)
                            
                        }else{
                            
                            
                            ReminderCell(
                                reminder: item
                            ) { event in
                                switch event{
                                case .onChecked(_):
                                    item.isCompleted.toggle()
                                    
                                    
                                case .onSelected(let select):
                                    selectedReminder = select
                                    isEditting = true
                                }
                                
                                
                                
                            }
                        }
                        
                        
                    }
                
                
                
                if showDialog==true && isEditting == false{
                    SelectedReminderCell(selectedReminder: $selectedReminder)
                }
                
                
            }.listStyle(.plain)
                .listRowSeparator(.hidden)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        if showDialog || isEditting {
                            Button {
                                saveReminder()
                            } label: {
                                Image(systemName: "checkmark")
                                    .foregroundStyle(buttonDisabled ? .gray : .white)
                            }.buttonStyle(.borderedProminent)
                                .tint(buttonDisabled ? .clear : .blue)
                            
                                .disabled(buttonDisabled)
                            
                        }
                    }
                    
                }
            
            
            if showDialog == false && isEditting == false  {
                Button {
                    showDialog = true
                    
                } label: {
                    ZStack{
                        Circle()
                            .fill(.blue)
                            .frame(maxWidth: 65,maxHeight: 65)
                        
                        Image(systemName: "plus")
                            .font(.system(size: 25))
                            .foregroundStyle(.white)
                        
                        
                    }
                    
                }.frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .bottomTrailing)
                .padding()}
            
            
            
        }
        
    }
}



extension ListDetailScreen{
    var buttonDisabled:Bool{
        return selectedReminder.name .isWhiteSpaceOrEmpty
      }
      
      
      private func saveReminder(){
          
          if(isEditting){
              let index = category.reminders.lastIndex{ $0.persistentModelID == selectedReminder.persistentModelID}
              guard let index = index else{ return }
              
              category.reminders[index] = selectedReminder
              
          }else{
              let reminder = ReminderItem(name: selectedReminder.name,note: selectedReminder.note.isWhiteSpaceOrEmpty ? "":  selectedReminder.note)
            category.reminders.append(reminder)
          }
          
         
          showDialog = false
          isEditting = false
          selectedReminder = ReminderItem(name: "",note: "")
          
          
      }
}

#Preview {
    
    NavigationStack{
        ListDetailScreen(category: CategoryItem.listItems[0])
    }
}
