//
//  BibleViewModel.swift
//  kjvonly
//
//  Created by man4christ on 10/13/23.
//

import Foundation
import SQLite3

class BibleViewModel {
    var bibleRepository: BibleRepositoryProtocol
    var currentChapter: Chapter = NullChapter
    var verses = Array<(key: Int, value: String)>()
    init(bibleRepository: BibleRepositoryProtocol) {
        self.bibleRepository = bibleRepository
        Task {
            self.currentChapter =  self.bibleRepository.GetObjectById(id: "1_1.json.gz")
            self.verses = self.currentChapter.verseMap.sorted(by: <)
        }
    }
    
    func GetChapter() {

        
    }
}
