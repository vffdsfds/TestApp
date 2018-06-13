//
//  OrderDetailViewController.swift
//  EliteTestApp
//
//  Created by Xin Chen on 2018/6/10.
//  Copyright © 2018年 Xin Chen. All rights reserved.
//

import UIKit

class OrderDetailViewController: BaseViewController {
    let orderDetailCell = "orderDetailCell"
    let groupCell = "groupCell"
    var orderModel:OrderModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        addRightNavBtn()
        baseTableView.backgroundColor = .white
        leftLabel.text = orderModel.name
    }
    func addRightNavBtn(){
        let backView = UIBarButtonItem(customView: rightBtn)
        navigationItem.rightBarButtonItem = backView
    }
    @objc func toBack(){
        self.navigationController?.popViewController(animated: true)
    }
    override func registerCell() {
        baseTableView.register(DetailOrderCell.self, forCellReuseIdentifier: orderDetailCell)
        baseTableView.register(GroupOrderCell.self, forCellReuseIdentifier: groupCell)
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section ==  0 {
            let cell:DetailOrderCell  = baseTableView.dequeueReusableCell(withIdentifier: orderDetailCell, for: indexPath) as! DetailOrderCell
            cell.setupShowDate(dataModel: orderModel, row: indexPath.row)
            return cell
        }else{
            let cell:GroupOrderCell  = baseTableView.dequeueReusableCell(withIdentifier: groupCell, for: indexPath) as! GroupOrderCell
            cell.setupShowDate(dataModel: orderModel.orderDescription as NSObject, row: indexPath.row)
            return cell
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : 2
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? 200 :100
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 20))
        headerView.backgroundColor = UIColor(red: 252/255, green: 154/255, blue: 157/255, alpha: 1)
        let label = UILabel(frame: CGRect(x: 10, y: 0, width: SCREEN_WIDTH-20, height: 20))
        label.textColor = UIColor.darkGray
        label.text =  section == 0 ? "Play alone" : "Play group"
        headerView.addSubview(label)
        return headerView
    }
    lazy var rightBtn:UIButton = {
        let rightBtn = UIButton(frame: CGRect(x: SCREEN_WIDTH-110, y: 5, width: 100, height: 30))
        rightBtn.setTitle("Back", for: .normal)
        rightBtn.setTitleColor(.white, for: .normal)
        rightBtn.backgroundColor = UIColor.lightGray
        rightBtn.layer.borderColor = UIColor.white.cgColor
        rightBtn.layer.borderWidth = 1
        rightBtn.layer.cornerRadius = 5

        rightBtn.addTarget(self, action: #selector(toBack), for: .touchUpInside)
        return rightBtn
    }()
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

