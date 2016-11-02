//
//  TLHttpService.swift
//  todolist
//
//  Created by yht on 25/10/2016.
//  Copyright © 2016 yht. All rights reserved.
//

//调用alamofire实现http REST 功能

import Foundation
import Alamofire
import ObjectMapper

class TLHttpService : NSObject
{
    
    
    func get (URL:URLConvertible, objFunc: @escaping (NSObject) -> Void)  {
        Alamofire.request(URL, method: .get).responseJSON { (response: DataResponse<Any>) in
            let mappedObject = response.result;
//            objFunc(mappedObject);
        }
    }
}
