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
    var currentChapter: Chapter = NullChapter
    var verses = Array<(key: Int, value: String)>()
    init(bibleRepository :BibleRepository) {
        self.bibleRepository = bibleRepository
        Task {
            self.currentChapter =  self.bibleRepository.GetObjectById(id: "50_3.json.gz")
            self.verses = self.currentChapter.verseMap.sorted(by: <)
        }
    }
    
    func GetChapter() {

        
    }
}
