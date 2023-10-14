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
    init (bibleDao: BibleDao){
        self.bibleDao = bibleDao
    }
    
   func GetObjectById(id: String){
        let chapterDao = bibleDao.GetChapterById(id: id)
        let decompressedData =  (chapterDao.data as NSData).gunzipped()
        let json = String(data: decompressedData ??  Data(), encoding: .utf8)
        if (decompressedData != nil ){
        }
    }
}
