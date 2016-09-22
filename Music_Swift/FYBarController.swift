//
//  FYBarController.swift
//  Music_Swift
//
//  Created by shun on 2016/9/22.
//  Copyright © 2016年 shun. All rights reserved.
//

import UIKit

class FYBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initTabBarController()
        // Do any additional setup after loading the view.
    }
    
    private func initTabBarController() {
        let item0 = FYMainViewController()
        self.addChildVC(VC: item0, title: "主页", image: "tab_icon_selection_normal", selectedImage: "tab_icon_selection_highlight")
        
        let item1 = FYTuiViewController()
        
        self.addChildVC(VC: item1, title: "推荐", image: "icon_tab_shouye_normal", selectedImage: "icon_tab_shouye_highlight")
        self.tabBar.backgroundColor = UIColor.white
        self.tabBar.barTintColor = UIColor.white
        self.tabBar.tintColor = UIColor.init(red: 252/255.0, green: 74/255.0, blue: 132/255.0, alpha: 0.9)
        
    }
    
    private func addChildVC(VC : UIViewController, title : String, image : String,selectedImage : String){
        VC.tabBarItem.title = title
        VC.tabBarItem.image = UIImage.init(named: image)
        VC.tabBarItem.selectedImage = UIImage.init(named: selectedImage)
        
        let nav = UINavigationController.init(rootViewController: VC)
        
        self.addChildViewController(nav)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
