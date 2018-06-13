//
//  VisitWebSiteView.swift
//  EliteTestApp
//
//  Created by Xin Chen on 2018/6/10.
//  Copyright © 2018年 Xin Chen. All rights reserved.
//

import UIKit

class BottomView: UIView {
    init(frame:CGRect , title:String){
        super.init(frame: frame)
        self.addSubview(bottomLabel)
        bottomLabel.text = title
        setUpUI()
    }
    required init?(coder aDecoder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
    }
    func setUpUI(){
        bottomLabel.snp.makeConstraints { (make) in
            make.left.top.width.height.equalToSuperview()
        }
    }
    func textView(_ textView: UITextView, shouldInteractWith URL: URL,
                  in characterRange: NSRange) -> Bool {
        
        return true
    }
    lazy var bottomLabel:UILabel = {
        let bottomLabel = UILabel()
        bottomLabel.textAlignment = .center
        bottomLabel.textColor = .black
        bottomLabel.font=thirdFont
        return bottomLabel
    }()
}
