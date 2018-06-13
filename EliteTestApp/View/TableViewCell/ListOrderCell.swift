//
//  listOrderCell.swift
//  EliteTestApp
//
//  Created by Xin Chen on 2018/6/10.
//  Copyright © 2018年 Xin Chen. All rights reserved.
//

import UIKit

protocol BuyEventDeleagte:NSObjectProtocol {
    func buyEvent(index:NSInteger)
}
class ListOrderCell: BaseTableViewCell {
    
    weak var delegate:BuyEventDeleagte?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    override func setUpUI() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(buyBtn)
        contentView.addSubview(line1)
        contentView.addSubview(line2)
        nameLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(30)
            make.width.equalTo(SCREEN_WIDTH/3)
        }
        priceLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(contentView.snp.centerX)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(nameLabel)
        }
        buyBtn.snp.makeConstraints { (make) in
            make.right.equalTo(-(SCREEN_WIDTH/3-70)/2)
            make.centerY.equalToSuperview()
            make.height.equalTo(30)
            make.width.equalTo(70)
        }
        line1.snp.makeConstraints { (make) in
            make.left.equalTo(nameLabel.snp.right)
            make.height.equalToSuperview()
            make.width.equalTo(1)
            make.centerY.equalToSuperview()
        }
        line2.snp.makeConstraints { (make) in
            make.left.equalTo(priceLabel.snp.right)
            make.centerY.height.width.equalTo(line1)
        }
    }
    override func setupShowDate(dataModel: NSObject, row: NSInteger) {
        let model:OrderModel = dataModel as! OrderModel
        nameLabel.text = model.name
        priceLabel.text = "$ \(model.price)"
    }
    @objc func toBuy(btn:UIButton){
        delegate?.buyEvent(index:btn.tag)
    }
    lazy var nameLabel:UILabel = {
        let nameLabel=UILabel()
        nameLabel.textAlignment = .center
        return nameLabel
    }()
    lazy var priceLabel:UILabel = {
        let priceLabel = UILabel()
        priceLabel.textAlignment = .center
        return priceLabel
    }()
    lazy var buyBtn:UIButton = {
        let buyBtn = UIButton()
        buyBtn.setTitle("Buy", for: .normal)
        buyBtn.setTitleColor(.white, for: .normal)
        buyBtn.backgroundColor = ButtonColor
        buyBtn.layer.cornerRadius = 15
        buyBtn.layer.borderWidth = 2
        buyBtn.layer.borderColor = UIColor.white.cgColor
        buyBtn.addTarget(self, action: #selector(toBuy(btn:)), for: .touchUpInside)
        return buyBtn
    }()
    lazy var line1:UIView = {
        let line1 = UIView()
        line1.backgroundColor = .lightGray
        return line1
    }()
    lazy var line2:UIView = {
        let line2 = UIView()
        line2.backgroundColor = .lightGray
        return line2
    }()
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
