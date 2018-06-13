//
//  OrderlistModel.swift
//  EliteTestApp
//
//  Created by Xin Chen on 2018/6/10.
//  Copyright © 2018年 Xin Chen. All rights reserved.
//

import UIKit

typealias callBack = (_ arr:NSArray , _ finish:Bool)->Void
class OrderModel: NSObject {
    var name = String()
    var price = Double()
    var orderDescription = String()
    static func getOrderList(callBack:@escaping callBack){
        let arr = NSMutableArray()
        for i in 0...10 {
            let orderModel = OrderModel()
            orderModel.name = "play\(i+1)"
            orderModel.price = Double((i+1)*10)
            orderModel.orderDescription = "This a sample play for the test \nThis a sample play for the test \nThis a sample play for the test"
            arr.add(orderModel)
        }
        callBack(arr, true)
    }
}

