//
//  FYMoreCategoryCell.swift
//  Music_Swift
//
//  Created by shun on 2016/10/8.
//  Copyright © 2016年 shun. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class FYMoreCategoryCell: UITableViewCell {
    
    
    func setCellDateSource(model:CCategoryCotents_L_List, indexPath:IndexPath){
        self.titleLb.text = model.title
        if indexPath.section == 0 {
            self.introLb.text = model.subtitle
        } else {
            self.introLb.text = model.intro
        }
        
        let url:URL?
        if indexPath.section == 0 {
            url = URL.init(string: model.coverPath)
        } else {
            url = URL.init(string: model.coverMiddle)
        }
        
        self.imageV.kf.setImage(with: url, placeholder: UIImage.init(named: "launchImage"), options: nil, progressBlock: nil, completionHandler: nil)
        
        if model.playsCounts > 10000 {
            self.playsLb.text = String.init(format: "%d万", model.playsCounts/10000)
        } else {
            self.playsLb.text = model.playsCounts.description
        }
        self.tracksLb.text = "\(model.tracksCounts)集"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    // 歌曲封面
    lazy var imageV : UIImageView =  {
        
        let image = UIImageView.init(image: UIImage.init(named: "findradio_bg"))
        self.contentView.addSubview(image)
        image.snp.makeConstraints({ (make) in
            make.left.equalTo(10);
            make.centerY.equalTo(0);
            make.width.height.equalTo(60);
        })
        image.addSubview($0)
        $0.snp.makeConstraints { (make) in
            make.top.left.equalTo(2);
            make.bottom.right.equalTo(-2);
        }
        return $0
    }(UIImageView())
    // 标题
    lazy var titleLb : UILabel = {
        self.contentView.addSubview($0)
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.snp.makeConstraints { (make) in
            make.top.equalTo(6)
            make.left.equalTo(self.imageV.snp.right).offset(12)
            make.right.equalTo(-10)
        }
        return $0
    }(UILabel.init())
    
    lazy var introLb : UILabel = {
        self.contentView.addSubview($0)
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.textColor = UIColor.lightGray
        $0.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.imageV)
            make.leadingMargin.equalTo(self.titleLb)
            make.right.bottom.equalTo(-10)
        }
        return $0
    }(UILabel.init())
    // 播放次数
    lazy var playsLb : UILabel = {
        self.contentView.addSubview($0)
        $0.font = UIFont.systemFont(ofSize: 11)
        $0.textColor = UIColor.lightGray
        
        $0.snp.makeConstraints { (make) in
            make.leadingMargin.equalTo(self.titleLb)
            make.bottom.equalTo(-10);
            make.width.lessThanOrEqualTo(100)
        }
        return $0
    }(UILabel.init())
    
    // 集数
    lazy var tracksLb : UILabel = {
        
        self.contentView.addSubview($0)
        $0.font = UIFont.systemFont(ofSize: 11)
        $0.textColor = UIColor.lightGray
        
        $0.snp.makeConstraints { (make) in
             make.bottom.equalTo(-10)
            make.left.equalTo(self.playsLb.snp.right).offset(20)
            make.width.lessThanOrEqualTo(100)
        }
        return $0
    }(UILabel.init())
    
}
