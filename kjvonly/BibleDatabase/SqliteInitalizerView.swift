//
//  ContentView.swift
//  kjvonly
//
//  Created by man4christ on 10/12/23.
//

import SwiftUI
import CoreData

struct SqliteInitalizerView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Bible.id, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Bible>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text("Item at \(item.id!)")
                    } label: {
                        Text(item.id!)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: PreloadSqliteDatabase) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            Text("Select an item")
        }
    }
    
    // Preload Sqlite database
    //
    // Need to add json.gz folder from launchpad.net/kjvonly-data repository to project.
    // It might be easier to start with a new Swift app with CoreData and then add this
    // function plus the json.gz folder to that projectg and generate sqlite files
    // use print(storeDescription.url?.absoluteString) in BibleDatabase Persistence.swift file
    // to determine the location of the sqlite databases.
    //
    // References:
    // https://www.appcoda.com/core-data-preload-sqlite-database/
    // https://stackoverflow.com/questions/58157957/reading-a-binary-file-in-swift
    private func PreloadSqliteDatabase() {
        withAnimation {
            guard let urls = Bundle.main.urls(forResourcesWithExtension: "json.gz", subdirectory: "json.gz") else {
                fatalError("Failed to find users.json")
            }
            
            for  url in urls   {
                print("Saving: " + url.relativeString)
                print(url.absoluteString)
                let newItem = Bible(context: viewContext)
                newItem.id = url.relativeString
                do {
                    newItem.data = try Data(contentsOf: url)
                }
                catch {
                    // Replace this implementation with code to handle the error appropriately.
                    // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    let nsError = error as NSError
                    fatalError("Unresolved error saving BibleData to Sqlite database \(nsError), \(nsError.userInfo)")
                }
                
                do {
                    try viewContext.save()
                } catch {
                    // Replace this implementation with code to handle the error appropriately.
                    // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    let nsError = error as NSError
                    fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                }
            }
            
            
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
