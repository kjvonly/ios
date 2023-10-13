//
//  Persistence.swift
//  kjvonly
//
//  Created by man4christ on 10/12/23.
//



import CoreData
import SwiftData
struct PersistenceController {
    static let shared = PersistenceController()
    
    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        for _ in 0..<10 {
            let newItem = Bible(context: viewContext)
            newItem.id = "string"
            newItem.data = Data()
        }
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()
    
    let container: NSPersistentContainer
    
    
    
    init(inMemory: Bool = false) {
        var path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        var url = URL(fileURLWithPath: path + "/kjvonly.sqlite")      // var getImagePath = paths.("filename")
        
        
        if !FileManager.default.fileExists(atPath: url.path) {
            guard let sqlite = Bundle.main.url(forResource: "kjvonly", withExtension: "sqlite") else {
                fatalError("Failed to find kjvonly.sqlite")
            }
            
            var destSqlite = URL(fileURLWithPath: path + "/kjvonly.sqlite")
            
            guard let shm = Bundle.main.url(forResource: "kjvonly", withExtension: "sqlite-shm") else {
                fatalError("Failed to find kjvonly.sqlite-shm")
            }
                var destShm = URL(fileURLWithPath: path + "/kjvonly.sqlite-shm")
   
            guard let wal = Bundle.main.url(forResource: "kjvonly", withExtension: "sqlite-wal") else {
                fatalError("Failed to find kjvonly.sqlite-wal")
            }
            var destWal = URL(fileURLWithPath: path + "/kjvonly.sqlite-wal")
            
            for f in [(sqlite, destSqlite), (shm, destShm), (wal, destWal)] {
                do
                {
                    try FileManager.default.copyItem(at: f.0, to: f.1)
                } catch {
                    fatalError("Failed to copying " + f.0.absoluteString)
                }
            }
        }

        container = NSPersistentContainer(name: "kjvonly")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            // Determine location of sqlite db on macbook
            //print(storeDescription.url?.absoluteString)
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
