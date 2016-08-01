//
//  PopTransition.swift
//  SecSwiftProgramer
//
//  Created by Pis on 16/7/27.
//  Copyright © 2016年 Kz. All rights reserved.
//

import UIKit

class PopTransition: NSObject, UIViewControllerAnimatedTransitioning {

    // 转场动画时间
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
    //POP动画
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) as! PushAnimationViewController
        let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) as! RightCenterViewController
        let container = transitionContext.containerView()
        
        let snapshotView = fromVC.headerImage!.snapshotViewAfterScreenUpdates(false)
        snapshotView.frame = container!.convertRect(fromVC.headerImage!.frame, fromView: fromVC.view)
        fromVC.headerImage!.hidden = true
        
        toVC.view.frame = transitionContext.finalFrameForViewController(toVC)
        toVC.headerImage!.hidden = true
        
        //4.都添加到 container 中。注意顺序不能错了
        container!.insertSubview(toVC.view, belowSubview: fromVC.view)
        container!.addSubview(snapshotView)
        
        //5.执行动画
        UIView.animateWithDuration(transitionDuration(transitionContext), delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            snapshotView.frame = container!.convertRect(toVC.headerImage!.frame, fromView: toVC.view)
            fromVC.view.alpha = 0
        }) { (finish: Bool) -> Void in
            toVC.headerImage!.hidden = false
            snapshotView.removeFromSuperview()
            fromVC.headerImage!.hidden = false
            
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        }
    }

}
