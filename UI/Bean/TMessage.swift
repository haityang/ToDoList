//
//  TMessage.swift
//  todolist
//
//  Created by yht on 3/2/16.
//  Copyright © 2016 yht. All rights reserved.
//

import Foundation
import ObjectMapper

//消息类型
enum TMsgType: Int {
    case tMsgTypeEI = 1     //emergency & import
    case tMsgTypeEUI = 2     //emergency & unimport
    case tMsgTypeUEI = 3    //un emergency & import
    case tmsgTypeUEUI = 4   //un emergency & un import
}


open class TMessage: Mappable {
    var title: String?
    var desc: String?
    var type = TMsgType.tmsgTypeUEUI
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        title <- map["title"]
        desc <- map["desc"]
        type <- map["type"]
    }
}
