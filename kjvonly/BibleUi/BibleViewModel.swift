//
//  BibleViewModel.swift
//  kjvonly
//
//  Created by man4christ on 10/13/23.
//

import Foundation
import SQLite3
class BibleViewModel {
    var bibleRepository: BibleRepository
    
    init(bibleRepository :BibleRepository) {
        self.bibleRepository = bibleRepository
    }
    
    func GetChapter() {
        self.bibleRepository.GetObjectById(id: "1_1.json.gz")
        
    }
}
