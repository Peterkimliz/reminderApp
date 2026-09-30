//
//  HomeScreen.swift
//  Reminders
//
//  Created by Apple on 29/09/2026.
//

import SwiftUI

struct HomeScreen: View {
    @State private var isPresentingNewListingSheet:Bool = false
    
    var body: some View {
        NavigationStack{
            
            MyListScreen()
                .sheet(isPresented: $isPresentingNewListingSheet, content: {
                   NewList()
                })
                .toolbar {
                    addNoteToolItem()
                    ToolbarSpacer(placement: .topBarTrailing)
                    aditToolBarItem()
                    ToolbarSpacer(placement: .topBarTrailing)
                    editToolBarItem()
                }
            
            
            
        }
    }
}

extension HomeScreen{
    
    @ToolbarContentBuilder
    private func addNoteToolItem()->some  ToolbarContent{
         ToolbarItem(placement: .topBarTrailing) {
            Button {
                isPresentingNewListingSheet = true
                
            } label: {
                Image(systemName: "note.text.badge.plus")
            }

        }
    }
    
    
    @ToolbarContentBuilder
    private func aditToolBarItem()->some ToolbarContent{
        ToolbarItem(placement: .topBarTrailing) {
            Button {
                
            } label: {
                Text("Edit")
            }

        }
    }
    
    
    @ToolbarContentBuilder
    private func editToolBarItem()-> some ToolbarContent{
        ToolbarItem(placement: .topBarTrailing) {
            Button {
                
            } label: {
                Image(systemName: "magnifyingglass")
            }

        }
    }
    
    
    
}



#Preview {
    HomeScreen()
}
