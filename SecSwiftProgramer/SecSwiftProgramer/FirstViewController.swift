//
//  FirstViewController.swift
//  SecSwiftProgramer
//
//  Created by Pis on 16/7/15.
//  Copyright © 2016年 Kz. All rights reserved.
//

import UIKit
import QuartzCore

// 闭包 come on  iOS中牛逼的block
typealias firstClosure = (Str:String) ->Void

class FirstViewController: UIViewController,UIAlertViewDelegate {
    
    // 闭包对应方法
    var myClosure:  firstClosure?
    
    // layer
    var emitter: CAEmitterLayer?
    
    
    func initWithClosure(closure: firstClosure?){
        myClosure = closure
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.title = "SecondPage"
        
        
        
        let secButton = UIButton(type:.Custom)
        secButton.backgroundColor = UIColor.brownColor()
        secButton.setTitle("点我", forState: UIControlState.Normal)
        secButton.layer.cornerRadius = 5
        self.view.addSubview(secButton)
        
        //点击方法
        secButton.addTarget(self, action: #selector(FirstViewController.closureClick(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        secButton.snp_makeConstraints { (make) in
            make.top.equalTo(self.view).inset(100)
            make.centerX.equalTo(self.view)
            make.size.equalTo(CGSizeMake(200, 40))
        }
        
        
        let thrButton = UIButton(type:.Custom)
        thrButton.backgroundColor = UIColor.grayColor()
        thrButton.setTitle("我也能点", forState: UIControlState.Normal)
        thrButton.layer.cornerRadius = 5
        self.view.addSubview(thrButton)
        
        //点击方法
        thrButton.addTarget(self, action: #selector(FirstViewController.closureClick2(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        thrButton.snp_makeConstraints { (make) in
            make.top.equalTo(self.view).inset(160)
            make.centerX.equalTo(self.view)
            make.size.equalTo(CGSizeMake(180, 40))
        }
        
        let secLabel = UILabel()
        secLabel.text = "第一行文字asdfghjkl;"
        secLabel.textColor = UIColor.blackColor()
        secLabel.font = UIFont.systemFontOfSize(14)
        secLabel.textAlignment = NSTextAlignment.Center
        self.view.addSubview(secLabel)
        secLabel.snp_makeConstraints { (make) in
            make.bottom.equalTo(secButton.snp_top).inset(-10)
            make.centerX.equalTo(self.view)
            make.size.equalTo(CGSizeMake(200, 15))
        }
        
        let fouButton = UIButton(type:.Custom)
        fouButton.backgroundColor = UIColor.magentaColor()
        fouButton.setTitle("Boom!", forState: UIControlState.Normal)
        fouButton.titleLabel?.font = UIFont.boldSystemFontOfSize(16)
        fouButton.titleLabel?.numberOfLines = 0
        fouButton.layer.cornerRadius = 25
        fouButton.layer.masksToBounds = true
        self.view.addSubview(fouButton)
        
        //点击方法
        fouButton.addTarget(self, action: #selector(FirstViewController.closureClick3(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        fouButton.snp_makeConstraints { (make) in
            make.top.equalTo(thrButton.snp_bottom).offset(20)
            make.centerX.equalTo(self.view)
            make.size.equalTo(CGSizeMake(50, 50))
        }
        
        // 科里化函数 把简化过程拆开 放弃语法糖   
        // 帮助分析代码
        
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    

    //点击按钮 执行 上级页面方法
    func closureClick(sender: UIButton){
        
        self.emitter?.removeFromSuperlayer()
        if (myClosure != nil) {
            myClosure!(Str:"success")
            self.navigationController?.popViewControllerAnimated(true)
        }
    }
    
    func closureClick2(sender: UIButton){
    
        self.emitter?.removeFromSuperlayer()
        let alert1 = UIAlertView(title: "我是alertView", message: "来个小提示", delegate: self, cancelButtonTitle: "取消", otherButtonTitles: "确定")
        alert1.show()
    }
    
    func closureClick3(sender: UIButton){
        
        self.getMess("调用一次类方法")
        
    }
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        if buttonIndex == 1 {
            print("alertView成功发射")
            let vc = SecViewController()
            // push后的页面navigationlbackitem 不显示文字
            let item = UIBarButtonItem(title: "", style: .Plain, target: self, action: nil)
            navigationItem.backBarButtonItem = item;
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    func getMess(Str: NSString) ->  (){
        print(Str)
        // 调用个粒子效果
        self.CreateAnimation()
    }
    
    // 来个Boom的粒子效果!
    func CreateAnimation(){
        
        // 类似直播类漂浮的心形动画都可以
        
        let rect = CGRectMake(0, 200, MAINWIDTH, 50)
        if (self.emitter == nil) {
            self.emitter = CAEmitterLayer()
        }
        view.layer.addSublayer(self.emitter!)
        self.emitter!.frame = rect
        self.emitter!.emitterShape = kCAEmitterLayerRectangle
        
        //kCAEmitterLayerPoint
        //kCAEmitterLayerLine
        //kCAEmitterLayerRectangle
        
        self.emitter!.emitterPosition = CGPointMake(rect.width/2, rect.height/2)
        self.emitter!.emitterSize = rect.size
        
        let emitterCell = CAEmitterCell()
        emitterCell.contents = UIImage(named: "icon")!.scaleImageToWidth(30).CGImage
        emitterCell.birthRate = 120  //每秒产生120个粒子
        emitterCell.lifetime = 3    //存活1秒
        emitterCell.lifetimeRange = 3.0
        
        self.emitter!.emitterCells = [emitterCell]  //这里可以设置多种粒子 我们以一种为粒子
        emitterCell.yAcceleration = 70.0  //给Y方向一个加速度
        emitterCell.xAcceleration = 20.0 //x方向一个加速度
        emitterCell.velocity = 20.0 //初始速度
        emitterCell.emissionLongitude = CGFloat(-M_PI) //向左
        emitterCell.velocityRange = 200.0   //随机速度 -200+20 --- 200+20
        emitterCell.emissionRange = CGFloat(M_PI_2) //随机方向 -pi/2 --- pi/2
        //emitterCell.color = UIColor(red: 0.9, green: 1.0, blue: 1.0,
        //   alpha: 1.0).CGColor //指定颜色
        emitterCell.redRange = 0.3
        emitterCell.greenRange = 0.3
        emitterCell.blueRange = 0.3  //三个随机颜色
        
        emitterCell.scale = 0.8
        emitterCell.scaleRange = 0.8  //0 - 1.6
        emitterCell.scaleSpeed = -0.15  //逐渐变小
        
        emitterCell.alphaRange = 0.75   //随机透明度
        emitterCell.alphaSpeed = -0.15  //逐渐消失       //这里可以设置多种粒子 先选择一种
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
