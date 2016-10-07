//
//  BaseModel.swift
//  Music_Swift
//
//  Created by shun on 2016/9/30.
//  Copyright © 2016年 shun. All rights reserved.
//

import UIKit

class BaseModel: NSObject {
    
    override init() {
//        super.init()
    }
    
    init(keyedValues: [String : Any]) {
        super.init()
        setValuesForKeys(keyedValues)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
