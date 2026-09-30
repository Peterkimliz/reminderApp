//
//  ColorPickerView.swift
//  Reminders
//
//  Created by Apple on 29/09/2026.
//

import SwiftUI

struct ColorPickerView: View {
    @Binding var selectedColor:Color
    
    private var colors:[Color] = [.red, .orange, .yellow, .green,.brown,.blue,.purple]
    
    var body: some View {
       
        
        HStack{
            ForEach(colors,id: \.self){ item in
                ZStack{
                    Circle()
                    .fill(item)
                    .padding(2)
                    
                        Circle()
                        .stroke(selectedColor == item ? .gray : .clear ,lineWidth: 4)
                        .scaleEffect(CGSize(width: 1.2, height: 1.2))
                         
                    
                    
                    
                }.onTapGesture {
                    selectedColor = item
                                    
                } .padding([.leading],3)
            
            }
            
        }
        .frame(maxWidth: .infinity,maxHeight: 100)
        .padding()
    }
}

#Preview {
    ColorPickerView(selectedColor: .constant(.blue))
}
