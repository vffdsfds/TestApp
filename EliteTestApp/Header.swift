//
//  Header.swift
//  iTunesShow
//
//  Created by Xin Chen on 2018/4/23.
//  Copyright © 2018年 Xin Chen. All rights reserved.
//

import Foundation
import UIKit

let SCREEN_WIDTH = UIScreen.main.bounds.size.width
let SCREEN_HEIGH = UIScreen.main.bounds.size.height

let ISIPHONEX:Bool = (SCREEN_HEIGH == 812.0) ? true : false
let HeightNavBar:CGFloat = ISIPHONEX ? 88.0 : 64.0
let FirstFont = UIFont.boldSystemFont(ofSize: 20)
let SecFont=UIFont.systemFont(ofSize: 18)
let thirdFont=UIFont.systemFont(ofSize: 16)
let fourFont=UIFont.systemFont(ofSize: 14)

let fourColor=UIColor(red: 200/255, green: 200/255, blue: 160/255, alpha: 0.2) 
let FirstColor=UIColor(red: 245/255, green: 67/255, blue: 101/255, alpha: 1) 
let SecColor=UIColor(red: 252/255, green: 154/255, blue: 157/255, alpha: 1)
let thirdColor=UIColor(red: 249/255, green: 205/255, blue: 157/255, alpha: 1)
let ButtonColor=UIColor(red: 131/255, green: 175/255, blue: 157/255, alpha: 1)

let FirstTitleColor=UIColor(red:7/255, green: 6/255, blue: 5/255, alpha: 1)
let SecTitleColor=UIColor(red:248/255, green: 125/255, blue: 9/255, alpha: 1)
let ThirdTitleColor=UIColor(red:87/255, green: 96/255, blue: 105/255, alpha: 1)

import SnapKit
import Kingfisher


