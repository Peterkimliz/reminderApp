//
//  MyListScreen.swift
//  Reminders
//
//  Created by Apple on 29/09/2026.
//

import SwiftUI
import SwiftData

struct MyListScreen: View {
    @Query private var listItems:[ListItem]
    
    var body: some View {
        
       
              List{
                    Text("My Lists")
                    .font(.system(size: 32))
                    .bold()

        
                    ForEach(listItems) { item in
                        
                        HStack {
                            Image(systemName: "line.horizontal.3.circle.fill")
                            Text(item.name.capitalized)
                            Spacer()
                            
                            Text("\(item.reminders.count)")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                        
                    }
                
            
        }
    }
}

#Preview {
    MyListScreen()
}
