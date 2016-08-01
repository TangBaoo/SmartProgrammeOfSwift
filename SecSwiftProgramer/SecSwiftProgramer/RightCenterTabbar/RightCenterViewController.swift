//
//  RightCenterViewController.swift
//  SecSwiftProgramer
//
//  Created by Pis on 16/7/25.
//  Copyright © 2016年 Kz. All rights reserved.
//

import UIKit

class RightCenterViewController: VvBaseViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    var upDateView: RightCenterUpDateView?
    var roundButton: UIButton?
    var headerImage: UIImageView?
    var pushBool: Bool?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "车"
        // Do any additional setup after loading the view.
        
        
        self.createUpView()
        
        
        
        self.roundButton = UIButton(type: .Custom)
        self.roundButton?.frame = CGRectMake(MAINWIDTH - 80, 264 - 30, 60, 60)
        self.roundButton?.layer.cornerRadius = 30
        self.roundButton?.backgroundColor = UIColor.orangeColor()
        self.view.addSubview(self.roundButton!)
        
        
        self.roundButton?.layer.shadowColor = UIColor.lightGrayColor().CGColor
        self.roundButton?.layer.shadowOffset = CGSizeMake(0, 3)
        self.roundButton?.layer.shadowOpacity = 0.8
        
        let pickButton = UIButton(type: .Custom)
        self.view.addSubview(pickButton)
        pickButton.snp_makeConstraints { (make) in
            make.top.equalTo(self.roundButton!.snp_bottom).offset(10)
            make.centerX.equalTo(self.view)
            make.size.equalTo(CGSizeMake(100, 40))
        }
        pickButton.layer.cornerRadius = 20
        pickButton.setTitle("试试拍照", forState: .Normal)
        pickButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        pickButton.backgroundColor = UIColor(red:0.01, green:0.7, blue:0.87, alpha:1)
        
        pickButton.addTarget(self, action: #selector(RightCenterViewController.sheetUp), forControlEvents: .TouchUpInside)
        
        self.headerImage = UIImageView()
        self.view.addSubview(self.headerImage!)
        self.headerImage?.snp_makeConstraints(closure: { (make) in
            make.top.equalTo(pickButton.snp_bottom).offset(10)
            make.centerX.equalTo(self.view)
            make.size.equalTo(CGSizeMake(160, 160))
        })
        self.headerImage?.layer.cornerRadius = 10
        self.headerImage?.layer.masksToBounds = true
        self.headerImage?.image = UIImage(named: "005.jpg")
        let imageClickGes = UITapGestureRecognizer(target: self, action: #selector(RightCenterViewController.imageClick))
        self.headerImage?.userInteractionEnabled = true
        self.headerImage?.addGestureRecognizer(imageClickGes)
        
        
        let messLabel = UILabel()
        self.view.addSubview(messLabel)
        messLabel.snp_makeConstraints { (make) in
            make.top.equalTo(self.headerImage!)
            make.right.equalTo(self.headerImage!.snp_leftMargin).offset(-30)
            make.size.equalTo(CGSizeMake(15, 100))
        }
        messLabel.text = "图片可以点"
        messLabel.numberOfLines = 0
        messLabel.font = UIFont.systemFontOfSize(16)
        messLabel.textColor = UIColor.blackColor()
        messLabel.textAlignment = .Center
        
    }
    
    
    func createUpView(){
        
        if self.upDateView == nil {

            self.upDateView = RightCenterUpDateView.init(frame: CGRectMake(0, 64, MAINWIDTH, 200))
            self.upDateView?.layer.shadowColor = UIColor.lightGrayColor().CGColor
            self.upDateView?.layer.shadowOffset = CGSizeMake(0, 3)
            self.upDateView?.layer.shadowOpacity = 0.8
        }
        
        self.view.addSubview(self.upDateView!)
    }
    
    // 图片点击push
    func imageClick(){
        
        self.pushBool = true
        let vc = PushAnimationViewController()
        vc.headImg = self.headerImage?.image
//        vc.hidesBottomBarWhenPushed = true
        self.tabBarController?.tabBar.hidden = true
        self.navigationController?.pushViewController(vc, animated: true)
        

    }
    
    
    
    //拍照
    func sheetUp(){
        
        let sheetAlertView = UIAlertController(title: "选哪个", message: "来吧", preferredStyle: .ActionSheet)
        
        let picAction = UIAlertAction(title: "拍照", style: .Default) { (UIAlertAction) in
            
            self.pushBool = false
            self.openImagePicker()
        }
        let imageListAction = UIAlertAction(title: "相册", style: .Default) { (UIAlertAction) in
            
            self.pushBool = false
            self.openPhotoList()
        }
        let cancelAction = UIAlertAction(title: "取消", style: .Cancel) { (UIAlertAction) in
            
        }
        
        sheetAlertView.addAction(picAction)
        sheetAlertView.addAction(imageListAction)
        sheetAlertView.addAction(cancelAction)
        
        self.presentViewController(sheetAlertView, animated: true) { 
            
        }
    }
    
    func openImagePicker() {
        
        let pick = UIImagePickerController()
        pick.delegate = self
        pick.sourceType = .Camera
        self.presentViewController(pick, animated: true, completion: nil)
    }
    
    func openPhotoList() {
        
        let photoList = UIImagePickerController()
        photoList.delegate = self
        photoList.sourceType = .PhotoLibrary
        self.presentViewController(photoList, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        self.headerImage?.image = info[UIImagePickerControllerOriginalImage] as? UIImage
    }
    
    // 取消imagePicker退出方法
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // 实现 UINavigationControllerDelegate 协议方法
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        
        if operation == UINavigationControllerOperation.Push {
            
            if self.pushBool == true {
                
                // 只有push页面时候才使用动画
                return PushTansition()
            } else {
                return nil
            }
            
        } else {
            return nil
        }
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.hidden = false
        
        // 因为动画POP回来 所以一定要每次协议都签订 不能卸载viewDidLoad里
        self.navigationController?.delegate = self
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
