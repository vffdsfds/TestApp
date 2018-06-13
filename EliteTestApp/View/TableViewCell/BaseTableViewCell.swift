//
//  BaseTableViewCell.swift
//  EliteTestApp
//
//  Created by Xin Chen on 2018/6/10.
//  Copyright © 2018年 Xin Chen. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .white
        self.selectionStyle = .none
        contentView.addSubview(line)
        self.setUpUI()
        line.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.bottom.equalTo(-1)
            make.width.equalToSuperview()
            make.height.equalTo(1)
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setUpUI() {
        
    }
    func setupShowDate(dataModel:NSObject , row:NSInteger){
        
    }
    lazy var line:UIView = {
        let line = UIView()
        line.backgroundColor = .lightGray
        return line
    }()
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
