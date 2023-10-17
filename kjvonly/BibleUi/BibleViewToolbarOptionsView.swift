//
//  ThemeModeView.swift
//  kjvonly
//
//  Created by man4christ on 10/14/23.
//


import SwiftUI


struct BibleViewToolbarOptionsView: View {
    
    var body: some View {
        Menu {
            Button(action: {}){
                Text("Text Format")
                Image(systemName: "textformat")
            }
        } label: {
            Label("", systemImage: "gearshape")
        }
    }
}
#Preview {
   BibleViewToolbarOptionsView()
}
