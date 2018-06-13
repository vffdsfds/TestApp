//
//  HomeTableViewController.swift
//  EliteTestApp
//
//  Created by Xin Chen on 2018/6/8.
//  Copyright © 2018年 Xin Chen. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    let homeCell = "homeCell"
    var model:WeclomeModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setUpUI()
    }
    func setUpUI(){
        view.addSubview(titleLabel)
        rect = CGRect(x: 0, y: titleLabel.frame.maxY+5, width: SCREEN_WIDTH, height: SCREEN_HEIGH-titleLabel.frame.maxY-15-120-50-35)
        baseTableView.frame = rect
        view.addSubview(lineView)
        view.addSubview(approveBtn)
        view.addSubview(lineView1)
    }
    override func getDate() {
        model = WeclomeModel()
    }
    @objc func toNextPage(){
        let vc =  OrderListViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    override func registerCell() {
        baseTableView.register(WelcomeCell.self, forCellReuseIdentifier: homeCell)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:WelcomeCell = baseTableView.dequeueReusableCell(withIdentifier: homeCell, for: indexPath) as! WelcomeCell
        //cell.setupShowDate(dataModel: model, row: indexPath.row)
        return cell
    }
    lazy var titleLabel:UILabel = {
        let titleLable = UILabel()
        titleLable.frame = CGRect(x: 0, y: HeightNavBar, width: SCREEN_WIDTH, height: 50)
        titleLable.textColor = UIColor.darkGray
        titleLable.textAlignment = .center
        titleLable.font = SecFont
        titleLable.text = "Welcome"
        titleLable.backgroundColor = UIColor(red: 252/255, green: 154/255, blue: 157/255, alpha: 1)
        return titleLable
    }()
     lazy var lineView:UIView = {
        let line = UIView(frame: CGRect(x: 0, y: titleLabel.frame.maxY+4, width: SCREEN_WIDTH, height: 1))
        line.backgroundColor = .lightGray
        return line
    }()
    lazy var lineView1:UIView = {
        let line = UIView(frame: CGRect(x: 0, y: baseTableView.frame.maxY+4, width: SCREEN_WIDTH, height: 1))
        line.backgroundColor = .lightGray
        return line
    }()
    lazy var approveBtn:UIButton = {
        let approveBtn = UIButton()
        approveBtn.frame.size = CGSize.init(width: 220, height: 40)

        approveBtn.center.x=SCREEN_WIDTH/2
        approveBtn.center.y = baseTableView.frame.maxY+45
        approveBtn.setTitle("Approve", for: .normal)
        approveBtn.setTitleColor(UIColor.darkGray, for: .normal)
        approveBtn.addTarget(self, action: #selector(toNextPage), for: .touchUpInside)
        approveBtn.backgroundColor = thirdColor
        
        return approveBtn
    }()
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

 

    
}
