//
//  Chapter.swift
//  kjvonly
//
//  Created by man4christ on 10/14/23.
//

import Foundation

struct Words: Codable {
    var text: String
    var `class`:  Array<String>
    var href: Array<String>
    var emphasis: Bool
}

struct Verse: Codable {
    var number: Int
    var words: Words
    var text: String
}

struct Chapter: Codable {
    var number: Int
    var bookName: String
    var verses: Dictionary<Int, Verse>
    var verseMap: Dictionary<Int, String>
    var footnotes: Dictionary<Int, String>
}
