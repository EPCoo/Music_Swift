//
//  FYNetManager.swift
//  Music_Swift
//
//  Created by shun on 2016/9/23.
//  Copyright © 2016年 shun. All rights reserved.
//

import UIKit
import Alamofire


let kkURLPath = "http://mobile.ximalaya.com/mobile/discovery/v2/category/recommends?categoryId=2&contentType=album&device=ios&scale=2&version=4.3.26.2"

let kURLPath = "http://mobile.ximalaya.com/mobile/discovery/v2/category/recommends"
let kURLVersion = "\"version\":\"4.3.26.2\""
let kURLDevice = "\"device\":\"ios\""
let KURLScale = "\"scale\":2"

class FYNetManager: NSObject {
    
    func GETReuest(
        _ url: URLConvertible,
        parameters: Parameters? = nil,
        finish:@escaping (String,String)->Void) {
        Alamofire.request(url, method: HTTPMethod.get, parameters: parameters, encoding: URLEncoding.default).responseJSON(completionHandler: { response in
            switch response.result {
            case .success:
                finish("请求成功","hah")
            case .failure:
                finish("请求失败", "hah")
            }
        })
    }
    
    func getContents(completionHandle: @escaping (String)->Void) {
//        let params = ["categoryId": "2","contentType" : "album", "device":"ios","scale":"2","version":"4.3.26.2"]
        FYNetManager().GETReuest(kkURLPath, parameters:nil) { (str1, str2) in
            completionHandle("\(str1),\(str2)")
        }
    }
    
}
