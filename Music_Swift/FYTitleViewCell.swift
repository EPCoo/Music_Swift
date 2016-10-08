//
//  FYTitleViewCell.swift
//  Music_Swift
//
//  Created by shun on 2016/10/8.
//  Copyright © 2016年 shun. All rights reserved.
//

import UIKit

class FYTitleViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    func setData(title: String, hasMore : Bool, titleTag : Int) {
        
        self.arrowIV.image = UIImage.init(named: "tabbar_np_play")
        self.arrowV.image = UIImage.init(named: "xm_accessory")
        self.tag = titleTag
        self.titleLb.textColor = UIColor.black
        self.titleLb.text = title
        if hasMore {
            self.moreBtn.setTitle("更多", for: .normal)
        }
        self.backgroundColor = UIColor.white
    }
    
    func moreClick() {
        print("moreClick")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    lazy var arrowV : UIImageView =  {
        self.contentView.addSubview($0)
        $0.snp.makeConstraints { (make) in
            make.right.equalTo(-4)
            make.bottom.equalTo(-12)
            make.size.equalTo(CGSize.init(width: 10, height: 15))
        }
        return $0
    }(UIImageView())
    
    lazy var arrowIV : UIImageView =  {
        self.contentView.addSubview($0)
        $0.snp.makeConstraints { (make) in
            make.left.equalTo(8)
            make.bottom.equalTo(-12)
            make.size.equalTo(CGSize.init(width: 12, height: 15))
        }
        return $0
    }(UIImageView())
    
    lazy var titleLb : UILabel =  {
        self.contentView.addSubview($0)
        $0.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.arrowIV)
            make.left.equalTo(self.arrowIV.snp.right).offset(4)
            make.width.equalTo(180)
        }
        $0.font = UIFont.systemFont(ofSize: 13)
        return $0
    }(UILabel())
    
    lazy var moreBtn : UIButton =  {
        self.contentView.addSubview($0)
        $0.snp.makeConstraints { (make) in
            make.right.equalTo(self.arrowV);
            make.centerY.equalTo(self.titleLb);
            make.size.equalTo(CGSize.init(width: 60, height: 20));
        }
        
        $0.setTitleColor(UIColor.gray, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        $0.titleLabel?.textAlignment = NSTextAlignment.right
        $0.setImage(UIImage.init(named: "cell_arrow"), for: .normal)
        $0.addTarget(self, action: #selector(FYTitleViewCell.moreClick), for: .touchUpInside)
        
        return $0
    }(UIButton())
}
