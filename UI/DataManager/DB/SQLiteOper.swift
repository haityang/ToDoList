//
//  SQLiteOper.swift
//  todolist
//
//  Created by yht on 15/11/2016.
//  Copyright © 2016 yht. All rights reserved.
//

import Foundation

let DB_NAME = "TodoList.db"
let TABLE_EVENT = "events"

class SQLiteOper {
    var sqlDB:SQLiteConnect?
    
    private init() {
        let urls = FileManager.default.urls(
            for: .documentDirectory, in: .userDomainMask)
        let sqlitePath = urls[urls.count-1].absoluteString + DB_NAME
        
        sqlDB = SQLiteConnect(path: sqlitePath)
    }
    
    //singleton
    static let shared = SQLiteOper()
    
    func sample() -> Void {
        // create table
        let _ = sqlDB?.createTable("students", columnsInfo: [
            "id integer primary key autoincrement",
            "name text",
            "height double"])
        
        // insert
        let _ = sqlDB?.insert("students", rowInfo: ["name":"'大強'","height":"178.2"])
        
        // select
        let statement = sqlDB?.fetch("students", cond: "1 == 1", order: nil)
        while sqlite3_step(statement) == SQLITE_ROW{
            let id = sqlite3_column_int(statement, 0)
            let name = String(cString: sqlite3_column_text(statement, 1))
            let height = sqlite3_column_double(statement, 2)
            print("\(id). \(name) 身高： \(height)")
        }
        sqlite3_finalize(statement)
        
        // update
        let _ = sqlDB?.update("students", cond: "id = 1", rowInfo: ["name":"'小強'","height":"176.8"])
        
        // delete
        let _ = sqlDB?.delete("students", cond: "id = 5")
    }

    
    
    //新增一项事件
    func insertItem(item:TMessage) -> Void {
        let _ = sqlDB?.insert(TABLE_EVENT, rowInfo: ["title":item.title!, "desc":String(item.desc!), "type":String(describing: item.type), "expire":String(item.expire)]);
    }
    
    //删除一项事件
    func removeItem(item:TMessage) -> Void {
        
    }
    
    //查询全部事件
    func InquireAll() -> Array<TMessage>? {
        return nil;
    }
}
