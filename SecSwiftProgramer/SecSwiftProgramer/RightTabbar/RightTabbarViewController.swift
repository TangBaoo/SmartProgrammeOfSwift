//
//  RightTabbarViewController.swift
//  SecSwiftProgramer
//
//  Created by Pis on 16/7/25.
//  Copyright © 2016年 Kz. All rights reserved.
//

import UIKit

class RightTabbarViewController: VvBaseViewController {

    var mySlider: UISlider?
    var sliderLabel: UILabel?
    
    var mySwitch: UISwitch?
    var switchLable: UILabel?
    
    var datePicker: UIDatePicker?
    var dateButton: UIButton?
    var dateLable: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "神"
        // Do any additional setup after loading the view.
        
        
        self.mySlider = UISlider()
        self.view.addSubview(self.mySlider!)
        self.mySlider?.snp_makeConstraints(closure: { (make) in
            make.top.equalTo(self.view).offset(84)
            make.left.equalTo(self.view).offset(20)
            make.size.equalTo(CGSizeMake(MAINWIDTH - 40, 30))
        })
        self.mySlider?.minimumValue = 0
        self.mySlider?.maximumValue = 100
        self.mySlider?.value = 0
        self.mySlider?.thumbTintColor = UIColor(red: 0.93, green: 0.35, blue: 0.25, alpha: 1)
        self.mySlider?.minimumTrackTintColor = UIColor(red: 0.93, green: 0.35, blue: 0.25, alpha: 1)
        self.mySlider?.addTarget(self, action: #selector(RightTabbarViewController.sliderScroll(_:)), forControlEvents: .ValueChanged)
        
        self.sliderLabel = UILabel()
        self.view.addSubview(self.sliderLabel!)
        self.sliderLabel?.snp_makeConstraints(closure: { (make) in
            make.top.equalTo(self.mySlider!.snp_bottomMargin).offset(20)
            make.left.equalTo(self.view)
            make.size.equalTo(CGSizeMake(MAINWIDTH, 20))
        })
        self.sliderLabel?.textAlignment = .Center
        self.sliderLabel?.textColor = UIColor.blackColor()
        self.sliderLabel?.font = UIFont.systemFontOfSize(16)
        self.sliderLabel?.text = "0%"
        
        
        self.mySwitch = UISwitch()
        self.view.addSubview(self.mySwitch!)
        self.mySwitch?.snp_makeConstraints(closure: { (make) in
            make.top.equalTo(self.sliderLabel!.snp_bottomMargin).offset(20)
            make.right.equalTo(self.view.snp_rightMargin).offset(-20)
            make.size.equalTo(CGSizeMake(80, 30))
        })
        self.mySwitch?.thumbTintColor = UIColor(red: 0.93, green: 0.35, blue: 0.25, alpha: 1)
        self.mySwitch?.onTintColor = UIColor(red: 0.70, green: 0.70, blue: 0.70, alpha: 1)
        self.mySwitch?.on = true
        self.mySwitch?.addTarget(self, action: #selector(RightTabbarViewController.switchChoose(_:)), forControlEvents: .ValueChanged)
        
        self.switchLable = UILabel()
        self.view.addSubview(self.switchLable!)
        self.switchLable?.snp_makeConstraints(closure: { (make) in
            make.top.equalTo(self.sliderLabel!.snp_bottomMargin).offset(20)
            make.left.equalTo(self.view).offset(20)
            make.size.equalTo(CGSizeMake(80, 30))
        })
        self.switchLable?.textAlignment = .Center
        self.switchLable?.textColor = UIColor.blackColor()
        self.switchLable?.font = UIFont.systemFontOfSize(16)
        self.switchLable?.text = "是"
        
        
        self.dateButton = UIButton(type: .Custom)
        self.view.addSubview(self.dateButton!)
        self.dateButton?.snp_makeConstraints(closure: { (make) in
            make.top.equalTo(self.switchLable!.snp_bottomMargin).offset(20)
            make.left.equalTo(self.view).offset(100)
            make.size.equalTo(CGSizeMake(MAINWIDTH - 200, 30))
        })
        self.dateButton?.setTitle("点一下选时间", forState: .Normal)
        self.dateButton?.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.dateButton?.titleLabel?.textAlignment = .Center
        self.dateButton?.backgroundColor = UIColor(red: 0.93, green: 0.35, blue: 0.25, alpha: 1)
        self.dateButton?.layer.cornerRadius = 5
        self.dateButton?.layer.masksToBounds = true
        self.dateButton?.addTarget(self, action: #selector(RightTabbarViewController.dateClick), forControlEvents: .TouchUpInside)
        
        self.dateLable = UILabel()
        self.view.addSubview(self.dateLable!)
        self.dateLable?.snp_makeConstraints(closure: { (make) in
            make.top.equalTo(self.dateButton!.snp_bottomMargin).offset(20)
            make.left.equalTo(self.view)
            make.size.equalTo(CGSizeMake(MAINWIDTH, 20))
        })
        self.dateLable?.textAlignment = .Center
        self.dateLable?.textColor = UIColor.blackColor()
        self.dateLable?.font = UIFont.systemFontOfSize(16)
        self.dateLable?.text = "这里是time"
        
        
        self.view.userInteractionEnabled = true
        let single = UITapGestureRecognizer(target: self, action: #selector(RightTabbarViewController.removeDatePicker))
        self.view.addGestureRecognizer(single)
    }

    
    // slider滚动
    func sliderScroll(slider: UISlider){
        
        self.sliderLabel?.text = "\(NSInteger(self.mySlider!.value))%"
    }
    
    
    // switch选择
    func switchChoose(Sender: UISwitch){
        
        if Sender.on == true {
            self.switchLable?.text = "是"
        } else {
            self.switchLable?.text = "否"
        }
    }
    
    //全屏点击
    func removeDatePicker(){
        
        self.datePicker?.removeFromSuperview()
    }
    
    // 召唤datepicker
    func dateClick(){
        
        self.datePicker?.removeFromSuperview()
        if self.datePicker == nil {
            
            self.datePicker = UIDatePicker()
            self.datePicker?.frame = CGRectMake(0, MAINHEIGHT - self.datePicker!.frame.size.height - 44, 0, 0)
            self.datePicker?.addTarget(self, action: #selector(RightTabbarViewController.dateValue(_:)), forControlEvents: .ValueChanged)
        }
        
        
        self.view.addSubview(self.datePicker!)
    }
    
    // 时间滚动
    func dateValue(datePicker: UIDatePicker){
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss";
        formatter.locale = NSLocale(localeIdentifier: "zh_CN")
        self.dateLable?.text = "\(formatter.stringFromDate(datePicker.date))"
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
