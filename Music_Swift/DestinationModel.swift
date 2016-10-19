//
//  DestinationModel.swift
//  Music_Swift
//
//  Created by shun on 2016/10/18.
//  Copyright © 2016年 shun. All rights reserved.
//

import UIKit

class DestinationModel : BaseModel{
    
    var tracks : DTracks = DTracks()
    
    var album : DAlbum = DAlbum()
    
    var msg : String = ""
    
    var ret : Int = 0
    
    override func setValue(_ value: Any?, forKey key: String) {
        super.setValue(value, forKey: key)
        if key == "album" {
            self.album = DAlbum.init(keyedValues: value as! [String : Any])
        } else if key == "tracks" {
            self.tracks = DTracks.init(keyedValues: value as! [String : Any])
        }
    }
}
class DAlbum : BaseModel {
    
    var status : Int = 0
    
    var title : String = ""
    
    var tags : String = ""
    
    var serialState : Int = 0
    
    var categoryName : String = ""
    
    var coverWebLarge : String = ""
    
    var coverMiddle : String = ""
    
    var nickname : String = ""
    
    var shares : Int = 0
    
    var intro : String = ""
    
    var hasNew : Bool = false
    
    var createdAt : Int = 0
    
    var isVerified : Bool = false
    
    var avatarPath : String = ""
    
    var albumId : Int = 0
    
    var updatedAt : Int = 0
    
    var coverSmall : String = ""
    
    var coverLarge : String = ""
    
    var coverOrigin : String = ""
    
    var uid : Int = 0
    
    var introRich : String = ""
    
    var zoneId : Int = 0
    
    var tracks : Int = 0
    
    var isFavorite : Bool = false
    
    var serializeStatus : Int = 0
    
    var categoryId : Int = 0
    
    var playTimes : Int = 0
    
}

class DTracks : BaseModel {
    
    
    var maxPageId : Int = 0
    
    var list : Array<DTracks_List> = Array()
    
    var pageId : Int = 0
    
    var pageSize : Int = 0
    
    var totalCount : Int = 0
    
    override func setValue(_ value: Any?, forKey key: String) {
        super.setValue(value, forKey: key)
        if key == "list" {
            var arr = [DTracks_List]()
            let vaArr = value as! Array<[String : Any]>
            for listDict in vaArr {
                let listObj = DTracks_List.init(keyedValues: listDict)
                arr.append(listObj)
            }
            self.list = arr
        }
    }
}

class DTracks_List : BaseModel {
    
    var status : Int = 0
    
    var title : String = ""
    
    var userSource : Int = 0
    
    var processState : Int = 0
    
    var duration : Float = 0
    
    var nickname : String = ""
    
    var likes : Int = 0
    
    var coverMiddle : String = ""
    
    var shares : Int = 0
    
    var playPathAacv224 : String = ""
    
    var createdAt : Double = 0.0
    
    var smallLogo : String = ""
    
    var albumTitle : String = ""
    
    var albumImage : String = ""
    
    var albumId : Int = 0
    
    var downloadAacUrl : String = ""
    
    var playUrl64 : String = ""
    
    var orderNum : Int = 0
    
    var playPathAacv164 : String = ""
    
    var playUrl32 : String = ""
    
    var uid : Int = 0
    
    var coverSmall : String = ""
    
    var coverLarge : String = ""
    
    var playtimes : Int = 0
    
    var downloadSize : Int = 0
    
    var downloadAacSize : Int = 0
    
    var downloadUrl : String = ""
    
    var comments : Int = 0
    
    var trackId : Int = 0
    
    var opType : Int = 0
    
    var isPublic : Bool = false
}
