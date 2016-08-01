//
//  PushAnimationViewController.swift
//  SecSwiftProgramer
//
//  Created by Pis on 16/7/27.
//  Copyright © 2016年 Kz. All rights reserved.
//

import UIKit

class PushAnimationViewController: VvBaseViewController, UINavigationControllerDelegate {

    var headerImage: UIImageView?
    var headImg: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "Push出个动画"
        self.navigationController?.delegate = self
        
        self.headerImage = UIImageView()
        self.view.addSubview(self.headerImage!)
        self.headerImage?.layer.cornerRadius = 10
        self.headerImage?.layer.masksToBounds = true
        self.headerImage?.snp_makeConstraints(closure: { (make) in
            make.edges.equalTo(EdgeInsetsMake(80, left: 20, bottom: -20, right: -20))
        })
        let imageClickGes = UITapGestureRecognizer(target: self, action: #selector(PushAnimationViewController.imageClick))
        self.headerImage?.userInteractionEnabled = true
        self.headerImage?.addGestureRecognizer(imageClickGes)
        
    }
    
    // 图片点击push
    func imageClick(){
        
        self.navigationController?.popViewControllerAnimated(true)
    }

    
    // pop执行动画
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == UINavigationControllerOperation.Pop {
            return PopTransition()
        } else {
            return nil
        }
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
