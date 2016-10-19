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
let KURLSpecial = "http://mobile.ximalaya.com/m/subject_list"

//let kURLPath = "http://mobile.ximalaya.com/mobile/discovery/v2/category/recommends"
//let kURLVersion = "\"version\":\"4.3.26.2\""
//let kURLDevice = "\"device\":\"ios\""
//let KURLScale = "\"scale\":2"


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
    /// 获取推荐内容
    func getContents(completionHandle : @escaping (ContentsModel?,NSError?)->Void) {
        FYNetManager().GETReuest(kkURLPath) { (dict, error) in
            if ((error) != nil) {
                completionHandle(nil,error)
            }else {
                let model = ContentsModel(keyedValues: dict!)
                
                completionHandle(model,nil)
            }
        }
    }
    
    /// 从网络上获取 选集信息  通过AlbumId, mainTitle, idAsc(是否升序)
    func getTracksForAlbumId(
        albumId : Int,
        title : String,
        isAsc : Bool,
        completionHandle : @escaping (DestinationModel?,NSError?)->Void){
        
        let params = ["albumId":"\(albumId)","title":title,"isAsc":"\(isAsc)","device":"ios","position":"1"]
        
        let path = String.init(format: "http://mobile.ximalaya.com/mobile/others/ca/album/track/%d/true/1/20", albumId)
        
        FYNetManager().GETReuest(path, parameters: params) { (dict, error) in
            if ((error) != nil) {
                completionHandle(nil,error)
            }else {
                let model = DestinationModel(keyedValues: dict!)
                
                completionHandle(model,nil)
            }
        }

    }
    
}
