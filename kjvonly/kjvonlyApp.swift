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
            let bdao: BibleDao = BibleDao()
            let br: BibleRepository = BibleRepository(bibleDao: bdao)
            let bvm:            BibleViewModel = BibleViewModel(bibleRepository: br)
            BibleView(vm: bvm)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
