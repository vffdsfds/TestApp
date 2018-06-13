//
//  DetailOrderCell.swift
//  EliteTestApp
//
//  Created by Xin Chen on 2018/6/10.
//  Copyright © 2018年 Xin Chen. All rights reserved.
//

import UIKit

class DetailOrderCell: BaseTableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setUpUI() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(midline)
        contentView.addSubview(descriptionLabel)
        nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(contentView).offset(10)
            make.width.equalTo(SCREEN_WIDTH-20)
            make.top.equalTo(contentView).offset(10)
            make.height.equalTo(35)
        }
        priceLabel.snp.makeConstraints { (make) in
            make.left.right.height.equalTo(nameLabel)
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
        }
        midline.snp.makeConstraints { (make) in
            make.width.equalTo(contentView)
            make.height.equalTo(1)
            make.top.equalTo(priceLabel.snp.bottom).offset(10)
            make.centerX.equalTo(contentView)
        }
        descriptionLabel.snp.makeConstraints { (make) in
            make.width.equalTo(nameLabel)
            make.height.equalTo(80)
            make.bottom.equalTo(contentView).offset(-10)
            make.centerX.equalTo(contentView)
        }
    }
    override func setupShowDate(dataModel: NSObject, row: NSInteger) {
        let model:OrderModel = dataModel as! OrderModel
        nameLabel.text = model.name
        priceLabel.text = "$ \(model.price)"
        descriptionLabel.text = model.orderDescription
    }
    lazy var nameLabel:UILabel = {
        let nameLabel=UILabel()
        return nameLabel
    }()
    lazy var priceLabel:UILabel = {
        let priceLabel = UILabel()
        return priceLabel
    }()
    lazy var descriptionLabel:UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.numberOfLines = 0
        descriptionLabel.isUserInteractionEnabled = true
        return descriptionLabel
    }()
    lazy var midline:UIView = {
        let midline = UIView()
        midline.backgroundColor = .lightGray
        return midline
    }()

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
