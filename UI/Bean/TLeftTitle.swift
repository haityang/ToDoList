//
//  TLeftTitle.swift
//  todolist
//
//  Created by yht on 02/11/2016.
//  Copyright © 2016 yht. All rights reserved.
//

import Foundation


open class TLeftTitleItem {
    var imageURL: String?
    var title: String?
}

open class TLeftTitle {
    var titles: [TLeftTitleItem]?
    
    init() {
        titles = sample()
    }
    
    //sample data
    func sample() -> [TLeftTitleItem] {
        var arr = [TLeftTitleItem]()
    
        var item: TLeftTitleItem = TLeftTitleItem()
        item.imageURL = "mobile-selector-etag-white"
        item.title = "全部"
        arr.append(item)
        
        item = TLeftTitleItem()
        item.imageURL = "mobile-selector-explore-white"
        item.title = "紧急重要"
        arr.append(item)
        
        item = TLeftTitleItem()
        item.imageURL = "mobile-selector-favorite-white"
        item.title = "紧急不重要"
        arr.append(item)
        
        item = TLeftTitleItem()
        item.imageURL = "mobile-selector-feedly-white"
        item.title = "重要不紧急"
        arr.append(item)
        
        item = TLeftTitleItem()
        item.imageURL = "mobile-selector-saved-white"
        item.title = "不重要不紧急"
        arr.append(item)
        
        return arr
    }
    
}
