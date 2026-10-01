//
//  ReminderCard.swift
//  Reminders
//
//  Created by Apple on 30/09/2026.
//

import SwiftUI

enum ReminderCellEvents{
    case onChecked(ReminderItem)
    case onSelected(ReminderItem)
}

struct ReminderCell: View {
    let reminder:ReminderItem
    let onCellItemTap:(ReminderCellEvents)->Void
    
    var body: some View {
        HStack(alignment: .top){
            Image(systemName: reminder.isCompleted ? "largecircle.fill.circle" : "circle")
                .padding([.trailing],3)
                .foregroundStyle(reminder.isCompleted ?.blue:.gray)
                .onTapGesture {
                    onCellItemTap(.onChecked(reminder))
                }
            
            
            VStack(alignment: .leading){
                Text(reminder.name.capitalized)
                    .font(.system(size: 20))
                
               
                Text(reminder.note)
                        .font(.system(size: 16))
                    .foregroundStyle(.gray)
        
                
                
                
            }
            Spacer()
            
            
        }.contentShape(RoundedRectangle(cornerRadius: 0))
         .onTapGesture {
             onCellItemTap(.onSelected(reminder))
        }
       
    }

    
}

#Preview {
    ReminderCell(reminder: CategoryItem.listItems[0].reminders[0]){(ReminderCellEvents) in
    }
}
