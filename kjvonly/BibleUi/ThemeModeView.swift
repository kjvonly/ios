//
//  ThemeModeView.swift
//  kjvonly
//
//  Created by man4christ on 10/14/23.
//


import SwiftUI


struct ThemeModeView: View {
    
    var body: some View {
        Menu {
            if (1 == 0) {
                Button(action: {}){
                    Text("Dark Mode")
                    Image(systemName: "moon.fill")
                }
            }
            else {
                Button(action: {}){
                    Text("Light Mode")
                    Image(systemName: "sun.max")
                }
            }
            
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
   ThemeModeView()
}
