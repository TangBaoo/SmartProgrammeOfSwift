//
//  RightCenterUpDateView.swift
//  SecSwiftProgramer
//
//  Created by Pis on 16/7/26.
//  Copyright © 2016年 Kz. All rights reserved.
//

import UIKit

class RightCenterUpDateView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    var dayLabel: UILabel?
    var mAndyLable: UILabel?
    var leftButton: UIButton?
    var rightButton: UIButton?
    var dateStr: NSDate?
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.backgroundColor = UIColor(red:0.01, green:0.7, blue:0.87, alpha:1)
        
        self.dayLabel = UILabel()
        self.addSubview(self.dayLabel!)
        self.dayLabel?.snp_makeConstraints(closure: { (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(self).offset(30)
            make.size.equalTo(CGSizeMake(100, 100))
        })
        self.dayLabel?.textColor = UIColor.whiteColor()
        self.dayLabel?.font = UIFont.systemFontOfSize(90)
        self.dayLabel?.textAlignment = NSTextAlignment.Center
        
        self.mAndyLable = UILabel()
        self.addSubview(self.mAndyLable!)
        self.mAndyLable?.snp_makeConstraints(closure: { (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(self.dayLabel!.snp_bottom).offset(10)
            make.size.equalTo(CGSizeMake(MAINWIDTH - 100, 30))
        })
        self.mAndyLable?.textColor = UIColor(red:0, green:0.54, blue:0.68, alpha:1)
        self.mAndyLable?.font = UIFont.boldSystemFontOfSize(16)
        self.mAndyLable?.textAlignment = NSTextAlignment.Center
        
        self.leftButton = UIButton.init(type: .Custom)
        self.addSubview(self.leftButton!)
        self.leftButton?.snp_makeConstraints(closure: { (make) in
            make.centerY.equalTo(self)
            make.left.equalTo(self).offset(10)
            make.size.equalTo(CGSizeMake(30, 25))
        })
        self.leftButton?.setImage(UIImage(named: "箭头A"), forState: .Normal)
        self.leftButton?.addTarget(self, action: #selector(RightCenterUpDateView.dateCLick(_:)), forControlEvents: .TouchUpInside)
        
        self.rightButton = UIButton.init(type: .Custom)
        self.addSubview(self.rightButton!)
        self.rightButton?.snp_makeConstraints(closure: { (make) in
            make.centerY.equalTo(self)
            make.rightMargin.equalTo(self).offset(-15)
            make.size.equalTo(CGSizeMake(30, 25))
        })
        self.rightButton?.setImage(UIImage(named: "箭头B"), forState: .Normal)
        self.rightButton?.addTarget(self, action: #selector(RightCenterUpDateView.dateCLick(_:)), forControlEvents: .TouchUpInside)
        
        
        
        self.dateRefresh(0)
    }
    
    func dateCLick(sender: UIButton){
        
        if sender == self.leftButton {
            
            self.dateRefresh(-1)
        } else {
            self.dateRefresh(1)
        }
    }
    
    func dateRefresh(upOrdown: NSInteger){
        
        if upOrdown == 0 {
            
            self.dateStr = NSDate()
        } else if upOrdown == -1 {
            
            self.dateStr = NSDate.init(timeInterval: -60 * 60 * 24, sinceDate: self.dateStr!)
        } else if upOrdown == 1 {
            
            self.dateStr = NSDate.init(timeInterval: 60 * 60 * 24, sinceDate: self.dateStr!)
        }
        
        let dateFormatter = NSDateFormatter()
        let dateFormatter2 = NSDateFormatter()
        dateFormatter.dateFormat = "dd"
        self.dayLabel?.text = dateFormatter.stringFromDate(self.dateStr!)
        
        dateFormatter.dateFormat = "MM"
        dateFormatter2.dateFormat = "yyyy"
        self.mAndyLable?.text = "\(dateFormatter.stringFromDate(self.dateStr!))月  \(dateFormatter2.stringFromDate(self.dateStr!))"
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
