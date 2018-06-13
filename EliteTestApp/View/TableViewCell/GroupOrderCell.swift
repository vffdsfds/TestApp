//
//  GroupOrderCell.swift
//  EliteTestApp
//
//  Created by Xin Chen on 2018/6/11.
//  Copyright © 2018年 Xin Chen. All rights reserved.
//

import UIKit

class GroupOrderCell: BaseTableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setUpUI() {
        contentView.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { (make) in
            make.top.left.equalTo(contentView).offset(10)
            make.bottom.right.equalTo(contentView).offset(-10)
        }
    }
    override func setupShowDate(dataModel: NSObject, row: NSInteger) {
        descriptionLabel.text = (dataModel as! String)
    }
    lazy var descriptionLabel:UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.numberOfLines = 0
        descriptionLabel.isUserInteractionEnabled = true
        return descriptionLabel
    }()
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
