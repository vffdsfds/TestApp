//
//  WelcomeCell.swift
//  EliteTestApp
//
//  Created by Xin Chen on 2018/6/10.
//  Copyright © 2018年 Xin Chen. All rights reserved.
//

import UIKit

class WelcomeCell: BaseTableViewCell {
    let textLable :NSMutableAttributedString = NSMutableAttributedString()
    let padding1 :NSMutableAttributedString = NSMutableAttributedString(string: "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nn\n\n\n\n\n\n\n")

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setUpUI() {
        let label :YYLabel = YYLabel()
        
        contentView.addSubview(label)
        
       
        
        
        
     
        //阴影
        let one :NSMutableAttributedString = NSMutableAttributedString(string: "Toftware License Agreement ")
        one.yy_font = FirstFont
        one.yy_color = FirstTitleColor
        let textShadow = YYTextShadow(color: UIColor(red: CGFloat(arc4random() % 256) / 255, green: CGFloat(arc4random() % 256) / 255, blue: CGFloat(arc4random() % 256) / 255, alpha: 1), offset: CGSize(width: 0, height: 0), radius: 5)
        one.yy_textShadow = textShadow
        one.yy_alignment=NSTextAlignment.left
        textLable.append(one)
         textLable.append(self.padding())
        
        //带边框的
        let five :NSMutableAttributedString = NSMutableAttributedString(string: "payment info:\nPersonal Integrity (Popular Version)\n Price: RMB 1688/year\nPersonal integrity pass (limited edition)\n Price: RMB 2800/year")
        five.yy_font = fourFont
        five.yy_color = SecTitleColor
        
        let border :YYTextBorder = YYTextBorder()
        border.strokeColor = SecTitleColor
        border.strokeWidth = 3
        border.lineStyle = YYTextLineStyle.patternCircleDot
        border.cornerRadius = 3
        border.insets = UIEdgeInsets(top: 0, left: -4, bottom: 0, right: -4)
        five.yy_textBackgroundBorder = border
        textLable.append(five)
        textLable.append(self.padding())
          textLable.append(self.padding())
        //内部阴影
        //另一种
        let seven :NSMutableAttributedString = NSMutableAttributedString(string: "Personal Integrity Agreement Content:")
        seven.yy_font = SecFont
        seven.yy_color = FirstTitleColor
        
        let sevenBorder :YYTextBorder = YYTextBorder()
        sevenBorder.cornerRadius = 50
        sevenBorder.insets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: -10)
        sevenBorder.strokeWidth = 0.5
        sevenBorder.strokeColor = seven.yy_color
        sevenBorder.lineStyle = YYTextLineStyle.single
        seven.yy_textBackgroundBorder = sevenBorder
    
        let sevenHighLight :YYTextHighlight = YYTextHighlight()
        sevenHighLight.setColor(UIColor.white)
        sevenHighLight.tapAction = { (containerView :UIView! ,text :NSAttributedString! ,range :NSRange! , rect :CGRect!) -> Void in

            
        }
        
        seven.yy_setTextHighlight(sevenHighLight, range: seven.yy_rangeOfAll())
        
        textLable.append(seven)
        textLable.append(self.padding())
        
        //带下划线的
        let six :NSMutableAttributedString = NSMutableAttributedString(string: "https://sites.google.com/view/elitemobileapps")
        six.yy_font = thirdFont
        six.yy_color = UIColor(red: 0.093, green: 0.492, blue: 1.000, alpha: 1.000)
        six.yy_underlineColor = six.yy_color
        six.yy_underlineStyle = NSUnderlineStyle.styleSingle
        
        let highLight :YYTextHighlight = YYTextHighlight()
        highLight.tapAction = { (containerView :UIView! ,text :NSAttributedString! ,range :NSRange! , rect :CGRect!) -> Void in
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
        
        six.yy_setTextHighlight(highLight, range: six.yy_rangeOfAll())
        
        textLable.append(six)
        textLable.append(self.padding())
        
        //组合阴影
        let three :NSMutableAttributedString = NSMutableAttributedString(string: " Welcome to use personal integrity software (Popular Edition) or personal integrity software (limited edition), hereinafter referred to as Software (Popular Version) or Personal Integrity Software (Limited Edition), described below The terms and conditions constitute the agreement reached between you and Software Co., Ltd. (hereinafter referred to as “Licensor”) regarding the license of the software (hereinafter referred to as “this agreement”). After you purchase and use the software, Advertising Co., Ltd. will Provide appropriate internet information services.Once you use the software, you have accepted the terms and conditions described below.")
        three.yy_font = thirdFont
        three.yy_color = FirstTitleColor
        
        let shadowThree = YYTextShadow(color: UIColor(white: 0.000, alpha: 0.20), offset: CGSize(width: 0, height: 1), radius: 1.5)
        
        let subShadowThree = YYTextShadow(color: UIColor(white: 1.000, alpha: 0.99), offset: CGSize(width: 0, height: 1), radius: 1.5)
        
        shadowThree.sub = subShadowThree
        three.yy_textShadow = shadowThree
        
        let innerShadowThree = YYTextShadow(color: UIColor(red: 0.851, green: 0.311, blue: 0.000, alpha: 0.700), offset: CGSize(width: 0, height: 1), radius: 1)
        
        three.yy_textInnerShadow = innerShadowThree
      
        textLable.append(three)
        textLable.append(padding1)
     
        textLable.yy_lineSpacing = 10
        textLable.yy_lineBreakMode = NSLineBreakMode.byWordWrapping
        label.attributedText = textLable
        label.textAlignment = NSTextAlignment.left
        label.textVerticalAlignment = YYTextVerticalAlignment.center
        label.numberOfLines = 0
        label.isUserInteractionEnabled = true
        label.backgroundColor = UIColor(white: 0.933, alpha: 1.000)
        
        label.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.top.equalTo(contentView).offset(10)
            make.right.equalTo(-10)
            make.bottom.equalTo(contentView).offset(-10)
        }
    }

    func padding() -> NSAttributedString
    {
        let padding :NSMutableAttributedString = NSMutableAttributedString(string: "\n")
        padding.yy_font = UIFont.systemFont(ofSize: 6.0)
        return padding
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
