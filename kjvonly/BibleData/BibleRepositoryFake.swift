//
//  BibleRepositoryFake.swift
//  kjvonly
//
//  Created by man4christ on 10/16/23.
//

import Foundation

class BibleRepositoryFake: BibleRepositoryProtocol {
 
    let decoder = JSONDecoder()
    
    func GetObjectById(id: String) -> Chapter {
        guard let url = Bundle.main.url(forResource: "1_1", withExtension: "json.gz") else {
            fatalError("Failed to find 1_1.json")
        }
        do {
            let bytes = try Data(contentsOf: url)
            let decompressedData =  (bytes as NSData).gunzipped()

            let chapter = try self.decoder.decode(Chapter.self,  from: decompressedData ??  Data())
            return chapter
            
        } catch {
            fatalError("not able to read 1_1.json.gz")
        }
    }
}
