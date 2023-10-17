//
//  bibleToolbar.swift
//  kjvonly
//
//  Created by man4christ on 10/16/23.
//

import Foundation


import SwiftUI



struct BibleToolbarView: ToolbarContent {
    
    
    var body: some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            Image("icon")
                .resizable()
                .aspectRatio(contentMode: .fit).frame(maxWidth: 40, maxHeight: 40)
        }
        
        ToolbarItemGroup(placement: .principal) {
            HStack{
                Button("Genesis 1", action: {})
            }
        }
        
        ToolbarItemGroup(placement: .navigationBarTrailing) {
            BibleViewToolbarOptionsView()
        }
    }
}
