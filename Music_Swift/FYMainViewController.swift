//
//  FYMainViewController.swift
//  Music_Swift
//
//  Created by shun on 2016/9/22.
//  Copyright © 2016年 shun. All rights reserved.
//

import UIKit
import Alamofire

class FYMainViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(red: 0.93, green: 0.93, blue: 0.93, alpha: 1.0)
        initNavigationController()
        initTableView()
       
    }

    private func initNavigationController() {
        self.navigationController?.navigationBar.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        
        let view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width - 20, height: 40))
        
        let navTitle = UILabel.init(frame: CGRect.init(x: view.frame.size.width/2 - 40, y: 0, width: 80, height: 44))
        
        navTitle.text = "竹影音乐"
        navTitle.font = UIFont.init(name: ".SFUIText-Semibold", size: 18)
        view.addSubview(navTitle)
        
        self.navigationItem.titleView = view
        
        let backItem = UIBarButtonItem()
        backItem.title = ""
        self.navigationItem.backBarButtonItem = backItem
        self.navigationController?.navigationBar.tintColor = UIColor.init(red: 252/255.0, green: 74/255.0, blue: 132/255.0, alpha: 0.9)
        
    }
    
    private func initTableView() {
        view.addSubview(tableView)
        tableView.frame = view.frame
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    lazy var tableView: UITableView = {
        $0.dataSource = self
        $0.delegate = self
        $0.register(UINib.init(nibName: "FYTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        return $0
    }(UITableView.init(frame: CGRect.zero, style: UITableViewStyle.grouped))
    
}

extension FYMainViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FYTableViewCell
        
        cell.xxlabel.text = indexPath.row.description
        
        return cell
    }
    
}

