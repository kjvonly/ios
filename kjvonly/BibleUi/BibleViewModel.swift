//
//  BibleViewModel.swift
//  kjvonly
//
//  Created by man4christ on 10/13/23.
//

import Foundation

class BibleViewModel {
    var bibleRepository: BibleRepository
    
    init(bibleRepository :BibleRepository) {
        self.bibleRepository = bibleRepository
    }
}
