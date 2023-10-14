//
//  kjvonlyApp.swift
//  kjvonly
//
//  Created by man4christ on 10/12/23.
//

import SwiftUI
import SwiftData

@main
struct kjvonlyApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            let br: BibleRepository = BibleRepository()
            let bvm:            BibleViewModel = BibleViewModel(bibleRepository: br)
            BibleView(bibleViewModel: bvm)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
