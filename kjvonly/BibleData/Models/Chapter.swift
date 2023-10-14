//
//  Chapter.swift
//  kjvonly
//
//  Created by man4christ on 10/14/23.
//

import Foundation

struct Words: Codable {
    let text: String
    let `class`:  Array<String>?
    let href: Array<String>?
    let emphasis: Bool
}

struct Verse: Codable {
    let number: Int
    let words: Array<Words>
    let text: String
}

struct Chapter: Codable {
    let number: Int
    let bookName: String
    let verses: Dictionary<Int, Verse>
    let verseMap: Dictionary<Int, String>
    let footnotes: Dictionary<Int, String>?
}

let NullChapter: Chapter = Chapter(number: -1, bookName: "", verses: Dictionary<Int, Verse>(), verseMap: Dictionary<Int, String>(), footnotes: nil)

