//
//  BibleDao.swift
//  kjvonly
//
//  Created by man4christ on 10/13/23.
//

import Foundation
import SQLite

class BibleDao {
    var db: Connection
    var bible: Table
    
    var id:  Expression<String>
    var data: Expression<Data>
    
    init(){
        do {
            let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
            let url = URL(fileURLWithPath: path + "/kjvonly.sqlite")
            let db = try Connection(path)
            self.db = db
            self.bible = Table("Bible")
        }catch {
            fatalError("failed to load database kjvonly.sqlite")
        }
    }
    
    func GetChapterById(id: String) -> Chapter {
        var chapter: Chapter = Chapter(id: "", data: Data())
        do {
            let query = self.bible.filter(self.id == id).limit(1)
            let rowIterator = try db.prepareRowIterator(query)
            for c in try Array(rowIterator) {
                chapter = Chapter(id: c[self.id], data: c[self.data])
            }
            return chapter
        }catch let error {
            fatalError("BibleDao.GetObjectById failed: \(error)")
        }
    }
}
