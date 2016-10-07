//
//  FYNetManager.swift
//  Music_Swift
//
//  Created by shun on 2016/9/23.
//  Copyright © 2016年 shun. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

let kkURLPath = "http://mobile.ximalaya.com/mobile/discovery/v2/category/recommends?categoryId=2&contentType=album&device=ios&scale=2&version=4.3.26.2"

let kURLPath = "http://mobile.ximalaya.com/mobile/discovery/v2/category/recommends"
let kURLVersion = "\"version\":\"4.3.26.2\""
let kURLDevice = "\"device\":\"ios\""
let KURLScale = "\"scale\":2"


class FYNetManager: NSObject {
    
    func GETReuest(
        _ url: URLConvertible,
        parameters: Parameters? = nil,
        finish:@escaping ([String:Any]?,NSError?)->Void) {
        Alamofire.request(url, method: HTTPMethod.get, parameters: parameters, encoding: URLEncoding.default).responseJSON(completionHandler: { response in
            switch response.result {
            case .success(let vlaue):
                let json = JSON(vlaue)
                finish(json.dictionaryObject,nil)
            case .failure:
                finish(nil,NSError())
            }
        })
    }
    
    func getContents(completionHandle: @escaping (ContentsModel?,NSError?)->Void) {
        FYNetManager().GETReuest(kkURLPath) { (dict, error) in
            if ((error) != nil) {
                completionHandle(nil,error)
            }else {
                let model = ContentsModel(keyedValues: dict!)
                
                completionHandle(model,nil)
            }
        }
    }
    
}
