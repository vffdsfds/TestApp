//
//  OrderListViewController.swift
//  EliteTestApp
//
//  Created by Xin Chen on 2018/6/10.
//  Copyright © 2018年 Xin Chen. All rights reserved.
//

import UIKit

class OrderListViewController: BaseViewController,BuyEventDeleagte {
    
    let orderListCell = "orderListCell"
    var arr = NSMutableArray()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func getDate() {
        OrderModel.getOrderList { (array, finsh) in
            self.arr = array as! NSMutableArray
            self.baseTableView.reloadData()
        }
    }
    func buyEvent(index: NSInteger) {
        let vc = OrderDetailViewController()
        vc.orderModel = arr[index] as! OrderModel
        self.navigationController?.pushViewController(vc, animated: true)
    }
    override func registerCell() {
        baseTableView.register(ListOrderCell.self, forCellReuseIdentifier: orderListCell)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return arr.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ListOrderCell = baseTableView.dequeueReusableCell(withIdentifier: orderListCell, for: indexPath)as!ListOrderCell
        cell.buyBtn.tag = indexPath.row
        cell.delegate = self
        cell.setupShowDate(dataModel: arr[indexPath.row] as! NSObject, row: indexPath.row)
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let title = UILabel(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 50))
        title.textAlignment = .center
        title.text = "Free Play"
        title.backgroundColor = SecColor
        title.textColor=UIColor.darkGray
        return title
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
