//
//  ContentsModel.swift
//  Music_Swift
//
//  Created by shun on 2016/9/30.
//  Copyright © 2016年 shun. All rights reserved.
//

import UIKit

class ContentsModel: BaseModel {
    var tags : ContentTags = ContentTags()
    var categoryContents : ContentCategorycontents = ContentCategorycontents()
    var hasRecommendedZones : Bool = false
    var focusImages : ContentFocusimages = ContentFocusimages()
    var msg : String = ""
    var ret : Int = 0
    
    override func setValue(_ value: Any?, forKey key: String) {
        super.setValue(value, forKey: key)
        if key == "tags" {
            self.tags = ContentTags.init(keyedValues: value as! [String : Any])
        } else if key == "categoryContents" {
            self.categoryContents = ContentCategorycontents.init(keyedValues: value as! [String : Any])
        } else if key == "focusImages" {
            self.focusImages = ContentFocusimages.init(keyedValues: value as! [String : Any])
        }
    }
}

class ContentTags : BaseModel {
    var maxPageId : NSInteger = 0
    var title : String = ""
    var count : Int = 0
    var list : Array<ContentTags_List> = Array()
    override func setValue(_ value: Any?, forKey key: String) {
        super.setValue(value, forKey: key)
        if key == "list" {
            var arr = [ContentTags_List]()
            let vaArr = value as! Array<[String : Any]>
            for listDict in vaArr {
                let listObj = ContentTags_List.init(keyedValues: listDict)
                arr.append(listObj)
            }
            self.list = arr
        }
    }
}

class ContentTags_List : BaseModel {
    var tname : String = ""
    var category_id : Int = 0
}

class ContentCategorycontents : BaseModel {
    var title : String = ""
    var ret : Int = 0
    var list : Array<CCategoryCotents_List> = Array()
    override func setValue(_ value: Any?, forKey key: String) {
        super.setValue(value, forKey: key)
        if key == "list" {
            var arr = [CCategoryCotents_List]()
            let vaArr = value as! Array<[String : Any]>
            for listDict in vaArr {
                let listObj = CCategoryCotents_List.init(keyedValues: listDict)
                arr.append(listObj)
            }
            self.list = arr
        }
    }

}

class CCategoryCotents_List : BaseModel {
    var title : String = ""
    var moduleType : Int = 0
    var list : Array<CCategoryCotents_L_List> = Array()
    
    var hasMore : Bool = false
    var contentType : String = ""
    var calcDimension : String = ""
    var tagName : String = ""
    
    
    override func setValue(_ value: Any?, forKey key: String) {
        super.setValue(value, forKey: key)
        if key == "list" {
            var arr = [CCategoryCotents_L_List]()
            let vaArr = value as! Array<[String : Any]>
            for listDict in vaArr {
                let listObj = CCategoryCotents_L_List.init(keyedValues: listDict)
                if self.moduleType == 2 {
                    continue
                }
                arr.append(listObj)
            }
            self.list = arr
        }
    }
}
class CCategoryCotents_L_List : BaseModel {
    var orderNum : Int = 0
    var top : Int = 0
    var subtitle : String = ""
    var period : Int = 0
    var contentType : Int = 0
    var firstId : Int = 0
    var title : String = ""
    var key : String = ""
    var rankingRule : String = ""
    var firstTitle : String = ""
    var firstKResults : Array<CC_L_L_Firstkresults> = Array()
    var calcPeriod : String = ""
    var coverPath : String = ""
    var categoryId : Int = 0
    
    var ID : Int = 0
    var intro : String = ""
    var uid : Int = 0
    var tracks : Int = 0
    var tracksCounts : Int = 0
    var playsCounts : Int = 0
    var isFinished : Int = 0
    var tags : String = ""
    var coverMiddle : String = ""
    var lastUptrackAt : Double = 0
    var albumCoverUrl290 : String = ""
    var serialState : Int = 0
    var albumId : Int = 0
    var nickname : String = ""
    var lastUptrackTitle : String = ""
    var lastUptrackId : Int = 0
    
    override func setValue(_ value: Any?, forKey key: String) {
        super.setValue(value, forKey: key)
        if key == "list" {
            var arr = [CC_L_L_Firstkresults]()
            let vaArr = value as! Array<[String : Any]>
            for listDict in vaArr {
                let listObj = CC_L_L_Firstkresults.init(keyedValues: listDict)
                arr.append(listObj)
            }
            self.firstKResults = arr
        }
    }
}

class CC_L_L_Firstkresults: BaseModel {
    
}
class ContentFocusimages : BaseModel {
    var title : String = ""
    var ret : Int = 0
    var list : Array<CFocusimages_List> = Array()
    
    override func setValue(_ value: Any?, forKey key: String) {
        super.setValue(value, forKey: key)
        if key == "list" {
            var arr = [CFocusimages_List]()
            let vaArr = value as! Array<[String : Any]>
            for listDict in vaArr {
                let listObj = CFocusimages_List.init(keyedValues: listDict)
                arr.append(listObj)
            }
            self.list = arr
        }
    }
}

class CFocusimages_List : BaseModel {
    var uid : Int = 0
    var shortTitle : String = ""
    var ID : Int = 0
    var pic : String = ""
    var albumId : Int = 0
    var isShare : Bool = false
    var is_External_url : Bool = false
    var type : Int = 0
    var longTitle : String = ""
    
}
