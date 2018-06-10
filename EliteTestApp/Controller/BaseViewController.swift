//
//  BaseTableViewController.swift
//  EliteTestApp
//
//  Created by Xin Chen on 2018/6/8.
//  Copyright © 2018年 Xin Chen. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    

    var table:UITableView!
    let arry:[String] = ["我是谁", "我从哪里来", "要到哪里去"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Set up UITableView frame
        let rect =  CGRect(x: 0, y: 0, width:SCREEN_WIDTH , height: SCREEN_HEIGH)
        table = UITableView(frame: rect)
        self.table.backgroundColor = UIColor.blue
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    }
    

}
