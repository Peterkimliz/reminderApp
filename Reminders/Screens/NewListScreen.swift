//
//  NewList.swift
//  Reminders
//
//  Created by Apple on 29/09/2026.
//

import SwiftUI
import SwiftData
struct NewListScreen: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    @State private var listName:String = ""
    @State private var selectedColor:Color = .blue
    
    
    
    private var isSaveButtonDisabled:Bool{
        return listName.isEmpty
    }
    
    var body: some View {
        NavigationStack{
            VStack{
               
        
                 Image(systemName: "line.horizontal.3.circle.fill")
                    .font(.system(size: 100))
                    .foregroundStyle(selectedColor)
   
               HStack {
                   
                    TextField("List Name", text:$listName)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .bold()
                        .font(.system(size: 25))
                        .foregroundStyle(selectedColor)
                        .padding()
                      
                   
                   if !isSaveButtonDisabled{
                       
                       Image(systemName: "xmark.circle.fill")
                           .font(.system(size: 30))
                           .foregroundStyle(.gray)
                         .padding([.trailing],10)
                         .onTapGesture {
                             listName = ""
                         }
                   }
                      
                   
                    
                }
            
               .overlay(RoundedRectangle(cornerRadius: 10).stroke(.gray,lineWidth: 1))
                .padding()
                
                
                ColorPickerView(selectedColor: $selectedColor)
                
                Spacer()
                
            }.navigationTitle("New List ")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                
                
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }

                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        let listItem = ListItem(name: listName, colorCode: "String")
                        context.insert(listItem)
                        dismiss()
                       
                    } label: {
                        Image(systemName: "checkmark")
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.blue)
                    .disabled(isSaveButtonDisabled)

                }
                
            }
        }
        
    }
}

#Preview {
    NewListScreen()
}
