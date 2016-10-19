//
//  FYMusicDetailCell.swift
//  Music_Swift
//
//  Created by shun on 2016/10/18.
//  Copyright © 2016年 shun. All rights reserved.
//

import UIKit
import Kingfisher

class FYMusicDetailCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setCellDateSource(viewModel:TracksViewModel, indexPath:IndexPath) {
        self.separatorInset = UIEdgeInsets.init(top: 0, left: 76, bottom: 0, right: 0)
        self.selectedBackgroundView = {
            $0.backgroundColor = UIColor.init(red: 243, green: 255, blue: 254, alpha: 1)
            return $0
        }(UIView())
        
        self.coverIV.kf.setImage(with: viewModel.coverURL(row: indexPath.row))
        
        self.titleLb.text = viewModel.title(row: indexPath.row)
        self.sourceLb.text = viewModel.nickName(row: indexPath.row)
        self.updateTimeLb.text = viewModel.updateTime(row: indexPath.row)
        self.playCountLb.text = viewModel.playsCount(row: indexPath.row)
        self.durationLb.text = viewModel.playTime(row: indexPath.row)
        self.favorCountLb.text = viewModel.favorCount(row: indexPath.row)
        self.commentCountLb.text = viewModel.commentCount(row: indexPath.row)
    }

    lazy var coverIV : UIImageView =  {
        self.contentView.addSubview($0)
        $0.snp.makeConstraints { (make) in
            make.centerY.equalTo(0)
            make.left.equalTo(10)
            make.size.equalTo(CGSize.init(width: 50, height: 50))
        }
        $0.layer.cornerRadius = 50/2
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    lazy var titleLb : UILabel =  {
        self.contentView.addSubview($0)
        $0.snp.makeConstraints { (make) in
            make.left.equalTo(self.coverIV.snp.right).offset(10);
            make.top.equalTo(10);
            make.right.equalTo(self.updateTimeLb.snp.left).offset(-10);

        }
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    lazy var updateTimeLb : UILabel =  {
        self.contentView.addSubview($0)
        $0.snp.makeConstraints { (make) in
            make.top.equalTo(20)
            make.right.equalTo(-10)
            make.width.equalTo(50)
        }
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.textAlignment = NSTextAlignment.right
        $0.textColor = UIColor.lightGray
        return $0
    }(UILabel())
    
    lazy var sourceLb : UILabel =  {
        self.contentView.addSubview($0)
        $0.snp.makeConstraints { (make) in
            make.leftMargin.equalTo(self.titleLb.snp.leftMargin)
            make.top.equalTo(self.titleLb.snp.bottom).offset(4)
            make.rightMargin.equalTo(self.titleLb.snp.rightMargin)
        }
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.textColor = UIColor.lightGray
        return $0
    }(UILabel())
    
    lazy var playCountLb : UILabel =  {
        self.contentView.addSubview($0)
        $0.snp.makeConstraints { (make) in
            make.leftMargin.equalTo(self.sourceLb.snp.leftMargin)
            make.bottom.equalTo(-10)
            make.top.equalTo(self.sourceLb.snp.bottom).offset(8)
        }
        $0.font = UIFont.systemFont(ofSize: 10)
        $0.textColor = UIColor.lightGray
        return $0
    }(UILabel())
    
    lazy var favorCountLb : UILabel =  {
        self.contentView.addSubview($0)
        $0.snp.makeConstraints { (make) in
            make.left.equalTo(self.playCountLb.snp.right).offset(3)
            make.centerY.equalTo(self.playCountLb)
        }
        $0.font = UIFont.systemFont(ofSize: 10)
        $0.textColor = UIColor.lightGray
        return $0
    }(UILabel())
    
    lazy var commentCountLb : UILabel =  {
        self.contentView.addSubview($0)
        $0.snp.makeConstraints { (make) in
            make.left.equalTo(self.favorCountLb.snp.right).offset(3)
            make.centerY.equalTo(self.favorCountLb)
        }
        $0.font = UIFont.systemFont(ofSize: 10)
        $0.textColor = UIColor.lightGray
        return $0
    }(UILabel())
    
    lazy var durationLb : UILabel =  {
        self.contentView.addSubview($0)
        $0.snp.makeConstraints { (make) in
            make.left.equalTo(self.commentCountLb.snp.right).offset(7)
            make.centerY.equalTo(self.commentCountLb)
        }
        $0.font = UIFont.systemFont(ofSize: 10)
        $0.textColor = UIColor.lightGray
        return $0
    }(UILabel())

}
