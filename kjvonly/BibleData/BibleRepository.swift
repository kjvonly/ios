//
//  BibleRepository.swift
//  kjvonly
//
//  Created by man4christ on 10/13/23.
//
// https://www.hackingwithswift.com/example-code/system/how-to-compress-and-decompress-data
import Foundation

class BibleRepository {
    func GetObjectById(id: String){
        
        // Get the managed object ID of the object
        let managedObject = // ... an NSManagedObject
        let managedObjectID = managedObject.objectID

        // Get a reference to a NSManagedObjectContext
        let context = persistentContainer.viewContext

        // Get the object by ID from the NSManagedObjectContext
        let object = try context.existingObject(
            with: managedObjectID
        )
    }
}
