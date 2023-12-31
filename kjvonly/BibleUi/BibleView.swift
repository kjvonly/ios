//
//  ContentView.swift
//  kjvonly
//
//  Created by man4christ on 10/12/23.
//

import SwiftUI
import CoreData


struct BibleView: View {
    let vm: BibleViewModel
    
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    if vm.currentChapter.number > 0 {
                        ForEach(vm.verses, id:  \.key) { k,v  in
                            Text("\(k) \(v)").fixedSize(horizontal: false, vertical: true)
                            Spacer()
                        }
                    }
                }
            }
            .padding()
            .toolbar(){
                BibleToolbarView()
            }
            .navigationBarTitle("", displayMode: .inline)
        }
    }
}

#Preview {
    BibleView(vm: BibleViewModel(bibleRepository: BibleRepositoryFake()))
}
