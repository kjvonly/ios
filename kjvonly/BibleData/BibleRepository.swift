//
//  BibleRepository.swift
//  kjvonly
//
//  Created by man4christ on 10/13/23.
//
// https://www.hackingwithswift.com/example-code/system/how-to-compress-and-decompress-data
import Foundation
import GZIP
protocol BibleRepositoryProtocol {
    func GetObjectById(id: String) -> Chapter
}

class BibleRepository : BibleRepositoryProtocol {
    var bibleDao: BibleDao
    
    let decoder = JSONDecoder()
    init (bibleDao: BibleDao){
        self.bibleDao = bibleDao
    }
    
    func GetObjectById(id: String) -> Chapter {
        let chapterDao = bibleDao.GetChapterById(id: id)
        let decompressedData =  (chapterDao.data as NSData).gunzipped()
        do {
            let chapter = try self.decoder.decode(Chapter.self,  from: decompressedData ??  Data())
            return chapter
        }catch let error {
            print("error decoding json for \(id): error: \(error)")
        }
        return NullChapter
        
    }
}

