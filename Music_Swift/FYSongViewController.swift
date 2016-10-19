//
//  FYSongViewController.swift
//  Music_Swift
//
//  Created by shun on 2016/10/8.
//  Copyright © 2016年 shun. All rights reserved.
//

import UIKit

class FYSongViewController: UIViewController {

    var albumId : Int = 0
    var oTitle : String = ""
    var destinationModel : DestinationModel = DestinationModel()
    lazy var tracksVM : TracksViewModel = {
        
        return $0
    }(TracksViewModel())
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.title = "专辑详情"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(tableView)
        tableView.frame = view.frame
        
        self.tracksVM.getDataCompletionHandle(albumId: albumId,title: oTitle) { (viewModel, error) in
            if error == nil {
                self.tracksVM = viewModel!
                self.tableView.reloadData()
            }
        }
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    lazy var tableView: UITableView = {
        $0.dataSource = self
        $0.delegate = self
        $0.register(FYMusicDetailCell.classForCoder(), forCellReuseIdentifier: "Celll")
        return $0
    }(UITableView.init(frame: CGRect.zero, style: UITableViewStyle.grouped))

}
extension FYSongViewController:UITableViewDelegate,UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tracksVM.rowNumber
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Celll", for: indexPath) as! FYMusicDetailCell
        cell.setCellDateSource(viewModel: self.tracksVM, indexPath: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
}
