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
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
