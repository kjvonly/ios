//
//  BibleRepository.swift
//  kjvonly
//
//  Created by man4christ on 10/13/23.
//
// https://www.hackingwithswift.com/example-code/system/how-to-compress-and-decompress-data
import Foundation
import GZIP
class BibleRepository {
    var bibleDao: BibleDao
    let decoder = JSONDecoder()
    init (bibleDao: BibleDao){
        self.bibleDao = bibleDao
    }
    
    func GetObjectById(id: String) -> Chapter? {
        var chapter: Chapter?
        let chapterDao = bibleDao.GetChapterById(id: id)
        let decompressedData =  (chapterDao.data as NSData).gunzipped()
        let json = String(data: decompressedData ??  Data(), encoding: .utf8)
        if (json != nil ){
            do {
              chapter = try self.decoder.decode(Chapter.self,  from: decompressedData ??  Data())
            }catch let error {
                print("error decoding json for \(id): error: \(error)")
            }
        }
        return chapter
    }
}
