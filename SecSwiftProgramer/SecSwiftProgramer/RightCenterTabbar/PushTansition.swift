//
//  PushTansition.swift
//  SecSwiftProgramer
//
//  Created by Pis on 16/7/27.
//  Copyright © 2016年 Kz. All rights reserved.
//

import UIKit

class PushTansition: NSObject, UIViewControllerAnimatedTransitioning{

    
    // 转场动画时间
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
    // 转出动画具体实现
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        //1.获取动画的源控制器和目标控制器
        let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) as! RightCenterViewController
        let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) as! PushAnimationViewController
        let container = transitionContext.containerView()
        
        //2.创建一个 选中 imageView 的截图，并把 imageView 隐藏，造成使用户以为移动的就是 imageView 的假象
        let snapshotView = fromVC.headerImage!.snapshotViewAfterScreenUpdates(false)
        snapshotView.frame = container!.convertRect(fromVC.headerImage!.frame, fromView: fromVC.view)
        fromVC.headerImage!.hidden = true
        
        //3.设置目标控制器的位置，并把透明度设为0，在后面的动画中慢慢显示出来变为1
        toVC.view.frame = transitionContext.finalFrameForViewController(toVC)
        toVC.view.alpha = 0
        
        //4.都添加到 container 中。注意顺序不能错了
        container!.addSubview(toVC.view)
        container!.addSubview(snapshotView)
        
        //5.执行动画
        UIView.animateWithDuration(transitionDuration(transitionContext), delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            snapshotView.frame = CGRectMake(20, 80, MAINWIDTH - 40, MAINHEIGHT - 100)
            toVC.view.alpha = 1
        }) { (finish: Bool) -> Void in
            fromVC.headerImage!.hidden = false
            toVC.headerImage!.image = toVC.headImg
            snapshotView.removeFromSuperview()
            
            //一定要记得动画完成后执行此方法，让系统管理 navigation
            transitionContext.completeTransition(true)
        }
    }
}
