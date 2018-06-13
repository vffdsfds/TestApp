//
//  BaseTableViewController.swift
//  EliteTestApp
//
//  Created by Xin Chen on 2018/6/8.
//  Copyright © 2018年 Xin Chen. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController{
    
    let cellID = "cellID"
    var rect:CGRect!
    override func viewDidLoad() {
        super.viewDidLoad()
        rect = CGRect(x: 0, y: HeightNavBar, width:SCREEN_WIDTH , height: SCREEN_HEIGH-100-HeightNavBar-35)
        registerCell()
        view.addSubview(baseTableView)
        view.addSubview(bottomView)
        view.addSubview(adView)
        setNavigation()
        getDate()
        
        view.addSubview(line)
       
       
    }
    func setNavigation(){
        let backView = UIBarButtonItem(customView: leftLabel)
        navigationItem.leftBarButtonItem = backView
 self.navigationController?.navigationBar.barTintColor = FirstColor   }
    func getDate(){
        
    }
    func registerCell(){
      baseTableView.register(BaseTableViewCell.self, forCellReuseIdentifier: cellID)
    }
    @objc func goToWeb(){
                    let urlString = "https://sites.google.com/view/elitemobileapps"
                    if let url = URL(string: urlString) {
                        //根据iOS系统版本，分别处理
                        if #available(iOS 10, *) {
                            UIApplication.shared.open(url, options: [:],
                                                      completionHandler: {
                                                        (success) in
                            })
                        } else {
                            UIApplication.shared.openURL(url)
                        }
                    }
    }
    lazy var leftLabel:UILabel = {
        let leftLabel = UILabel(frame: CGRect(x: 10, y: 5, width: 160, height: 30))
        leftLabel.text = "This is Header"
        leftLabel.textColor = .white
        leftLabel.font = FirstFont
        return leftLabel
    }()
    lazy var baseTableView:UITableView = {
        let table = UITableView(frame: rect, style: .plain)
        table.backgroundColor = UIColor(red: 252/255, green: 154/255, blue: 157/255, alpha: 1)
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = UITableViewCellSeparatorStyle.none
        table.estimatedRowHeight = 44
        table.rowHeight = UITableViewAutomaticDimension
        return table
    }()
    lazy var line:UIView = {
        let line = UIView(frame: CGRect(x: 0, y: bottomView.frame.minY - 99, width: SCREEN_WIDTH, height: 1))
        line.backgroundColor = .lightGray
        return line
    }()
    lazy var adView:CycleView! = {
        let adView = CycleView(frame: CGRect(x: 0, y: bottomView.frame.minY - 100, width: SCREEN_WIDTH, height: 100))
        let randomNumber:Int = Int(arc4random() % 5) + 1

       
        switch randomNumber {
        case 1:
            // example 01
            adView.placeholderImage = #imageLiteral(resourceName: "Elite")
             adView.setImagesGroup([#imageLiteral(resourceName: "ad10"),#imageLiteral(resourceName: "ad11"),#imageLiteral(resourceName: "ad12"),#imageLiteral(resourceName: "ad13")], titlesGroup: ["Every day special offer ","A feeling of warmth","Fast match, timely push","Temperament spring clothes, one piece"])
            adView.pageControlIndictirColor = UIColor.purple
            adView.pageControlCurrentIndictirColor = UIColor.gray
            adView.scrollDirection = .vertical
             adView.itemSize = CGSize(width: 320, height: 100)
            adView.delegate = self as? CycleViewProtocol
            
        case 2:
            
            // example 04
            adView.backgroundColor = .white
            adView.setImagesGroup([#imageLiteral(resourceName: "pic1"),#imageLiteral(resourceName: "pic2"),#imageLiteral(resourceName: "pic3"),#imageLiteral(resourceName: "pic4")], titlesGroup: ["Every day special offer ","A feeling of warmth","Fast match, timely push","Temperament spring clothes, one piece"])
            adView.itemSize = CGSize(width: 220, height: 50)
            adView.itemSpacing = 40
            adView.itemZoomScale = 1.2
            adView.itemBorderWidth = 1
            adView.itemBorderColor = UIColor.white
            adView.pageControlIndictorImage = #imageLiteral(resourceName: "down")
            adView.pageControlCurrentIndictorImage = #imageLiteral(resourceName: "up")
            adView.pageControlHeight = 18
            adView.pageControlItemSize = CGSize(width: 16, height: 16)
            adView.pageControlAlignment = .right
            adView.didSelectedItem = {
                print("cycleView4 didSelectedItem:  \($0)")
            }
        case 3:
            // example 02
            adView.timeInterval = 3
            adView.placeholderImage = #imageLiteral(resourceName: "Elite")
            DispatchQueue.main.asyncAfter(deadline: .now()+2) {
              //  self.adView.s
                 adView.setImagesGroup([#imageLiteral(resourceName: "ad1"),#imageLiteral(resourceName: "ad2"),#imageLiteral(resourceName: "ad3"),#imageLiteral(resourceName: "ad4")], titlesGroup: ["Every day special offer ","A feeling of warmth","Fast match, timely push","Temperament spring clothes, one piece"])
            }
            adView.pageControlItemSize = CGSize(width: 16, height: 4)
            adView.pageControlCurrentItemSize = CGSize(width: 8, height: 8)
            adView.pageControlIndictirColor = UIColor.purple
            adView.pageControlCurrentIndictirColor = UIColor.gray
            adView.pageControlHeight = (adView.frame.size.height-40)/2
            adView.itemSize = CGSize(width: 220, height: 50)
            adView.itemZoomScale = 1.2
            adView.didSelectedItem = {
                print("cycleView2 didSelectedItem:  \($0)")
            }
            
            
        case 4:
            // example 03
            adView.setTitlesGroup(["For more information, please visit the official website"," Elite Tech Apps","If you have any questions, please feel free to contact our e-mail: chenxin.ariel@gmail.com","Welcome, thank you for your support", "star✨✨✨✨✨✨"])
            adView.setTitleImagesGroup([#imageLiteral(resourceName: "Elite"),#imageLiteral(resourceName: "Elite"),#imageLiteral(resourceName: "Elite")], sizeGroup: [CGSize(width: 100, height: 50),CGSize(width: 100, height: 50),CGSize(width: 100, height: 50)])
            adView.titleBackgroundColor = UIColor.white
            adView.titleColor = UIColor.blue
            adView.scrollDirection = .vertical
            adView.didSelectedItem = {
                print("cycleView3 didSelectedItem:  \($0)")
            }
            
        default:
            // example 05
            let titles: [NSString] = ["Live · 2017 Wei Mi live show \n Angels stunning fit","Wufangzhai dice advertising \n white fat tomorrow","Lurpak Butter Creative Advertising \n Busy Breakfast","New Zealand McDonald's BigMac 50th Anniversary \nAdvertisement Timeless","[Challenge the limit · Essence Edition] Sun Hong Lei roaring car wash was frozen silly"]
            
            let attibutedTitles = titles.map { (str) -> NSAttributedString in
                let arr = str.components(separatedBy: "\n")
                let attriStr = NSMutableAttributedString(string:str as String)
                attriStr.addAttributes([.foregroundColor: UIColor.green, .font: UIFont.systemFont(ofSize: 11)], range: NSMakeRange(0, arr[0].count))
                if arr.count > 1 {
                    attriStr.addAttributes([.foregroundColor: UIColor.white, .font: UIFont.systemFont(ofSize: 10)], range: NSMakeRange(arr[0].count+1, arr[1].count))
                }
                return attriStr
            }
            
            adView.timeInterval = 3
            adView.setImagesGroup([#imageLiteral(resourceName: "ad5"),#imageLiteral(resourceName: "ad6"),#imageLiteral(resourceName: "ad7"),#imageLiteral(resourceName: "ad8"),#imageLiteral(resourceName: "ad9")], attributedTitlesGroup: attibutedTitles)
            adView.itemSize = CGSize(width: 220, height: 50)
            adView.itemSpacing = 5
            adView.titleBackgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
            adView.titleNumberOfLines = 0
            adView.titleViewHeight = 40
            adView.pageControlIsHidden = true
        }
       
        
      
        return adView
    }()
    lazy var bottomView:BottomView = {
        let bottomView = BottomView(frame: CGRect(x: 0, y: SCREEN_HEIGH-35, width: SCREEN_WIDTH, height: 35), title: "Visit Our Website（Click Here） ")
        bottomView.backgroundColor = fourColor
        bottomView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(goToWeb))
        bottomView.addGestureRecognizer(tap)
        return bottomView
    }()

}
extension BaseViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:BaseTableViewCell =  baseTableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! BaseTableViewCell
        cell.backgroundColor = .white
        return cell
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNonzeroMagnitude
    }
}
