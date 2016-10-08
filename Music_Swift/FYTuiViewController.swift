//
//  FYTuiViewController.swift
//  Music_Swift
//
//  Created by shun on 2016/9/22.
//  Copyright © 2016 shun. All rights reserved.
//

import UIKit
import Kingfisher

class FYTuiViewController: UIViewController {
   
    var contentsModel : ContentsModel = ContentsModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(tableView)
        tableView.frame = view.frame
        
        FYNetManager().getContents { (model, error) in
            if error == nil {
                self.contentsModel = model!
                self.tableView.reloadData()
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    lazy var tableView: UITableView = {
        $0.dataSource = self
        $0.delegate = self
        $0.register(FYMoreCategoryCell.classForCoder(), forCellReuseIdentifier: "Celll")
        return $0
    }(UITableView.init(frame: CGRect.zero, style: UITableViewStyle.grouped))
}

extension FYTuiViewController:UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.contentsModel.categoryContents.list.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.contentsModel.categoryContents.list.count > 0 {
            return self.contentsModel.categoryContents.list[section].list.count;
        }
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Celll", for: indexPath) as! FYMoreCategoryCell
        cell.setCellDateSource(model: self.contentsModel.categoryContents.list[indexPath.section].list[indexPath.row], indexPath: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
