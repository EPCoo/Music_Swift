//
//  TracksViewModel.swift
//  Music_Swift
//
//  Created by shun on 2016/10/18.
//  Copyright © 2016年 shun. All rights reserved.
//

import UIKit

class TracksViewModel: BaseViewModel {
    var model : DestinationModel = DestinationModel()
    var rowNumber : Int {
        get {
            return self.model.tracks.list.count
        }
    }
   
    func coverURL(row: Int) -> URL {
        let path = self.model.tracks.list[row].coverSmall
        if path.isEqual("") {
            return URL.init(string: self.model.tracks.list[0].coverSmall)!
        } else {
            return URL.init(string: path)!
        }
    }
    
    func title(row: Int) -> String {
        return self.model.tracks.list[row].title
    }
    func nickName(row: Int) -> String {
        return String.init(format: "by %@", self.model.tracks.list[row].nickname)
    }
    
    func updateTime(row: Int) -> String {
        // 获取当前时时间戳
        let currentTime = Date.timeIntervalBetween1970AndReferenceDate
        // 创建歌曲时间戳
        let createTime = self.model.tracks.list[row].createdAt/1000
        // 时间差
        let time = currentTime - createTime
        // 秒转小时
        let hours = time/3600
        if (hours<24) {
            return String.init(format: "%ld小时前", hours)
        }
        //秒转天数
        let days = time/3600/24
        if (days < 30) {
            return String.init(format: "%ld天前", days)
        }
        //秒转月
        let months = time/3600/24/30
        if (months < 12) {
            return String.init(format: "%ld月前", months)
        }
        //秒转年
        let years = time/3600/24/30/12
        return String.init(format: "%ld年前", years)
    }
    
    func playsCount(row: Int) -> String {
        //如果超过万，要显示*.*万
        let count = self.model.tracks.list[row].playtimes
        
        if (count < 10000) {
            return "\(self.model.tracks.list[row].playtimes)"
        }else{
            return String.init(format:"%.1f万", count/10000);
        }
    }
    
    func playTime(row: Int) -> String {
        let duration = self.model.tracks.list[row].duration
        // 分
        let minutes = duration / 60
        // 秒
        let seconds = Int(duration) % 60
        return String.init(format:"%02ld:%02ld",minutes,seconds)
    }
    
    func favorCount(row: Int) -> String {
        //如果超过万，要显示*.*万
        let count = self.model.tracks.list[row].likes
        if (count < 10000) {
            return "\(self.model.tracks.list[row].likes)";
        }else{
            return String.init(format:"%.1f万", count/10000)
        }
    }
    
    func commentCount(row: Int) -> String {
        return "\(self.model.tracks.list[row].comments)"
    }
    func getDataCompletionHandle(
        albumId : Int,
        title : String,
        completionHandle : @escaping (TracksViewModel?,NSError?)->Void){
        FYNetManager().getTracksForAlbumId(albumId: albumId, title: title, isAsc: true) { (model, error) in
            if error == nil {
                self.model = model!
                completionHandle(self,nil)
            }else {
                completionHandle(nil,error)
            }
        }
    }
}
