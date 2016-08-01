//
//  AppDelegate.swift
//  SecSwiftProgramer
//
//  Created by Pis on 16/7/15.
//  Copyright © 2016年 Kz. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UITabBarDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window!.backgroundColor = UIColor.whiteColor()
        
        let rootView = ViewController()
        let leftView = LeftTabbarViewController()
        let leftCenterView = LeftCenterViewController()
        let rightCenterView = RightCenterViewController()
        let rightView = RightTabbarViewController()
        
        
        let rootNavigationController = UINavigationController(rootViewController: rootView)
        let leftViewNav = UINavigationController(rootViewController: leftView)
        let leftCenterViewNav = UINavigationController(rootViewController: leftCenterView)
        let rightCenterViewNav = UINavigationController(rootViewController: rightCenterView)
        let rightViewNav = UINavigationController(rootViewController: rightView)
        
        let rootViewTabbar = UITabBarItem(title: "山", image: UIImage(named: "tabbar-亲情"), selectedImage: UIImage(named: "tabbar-亲情-on"))
        let leftViewTabbar = UITabBarItem(title: "秋", image: UIImage(named: "TabBar-电影A"), selectedImage: UIImage(named: "TabBar-电影B"))
        let leftCenterViewTabbar = UITabBarItem(title: "明", image: UIImage(named: "tabbar-我的"), selectedImage: UIImage(named: "tabbar-我的-on"))
        let rightCenterViewTabbar = UITabBarItem(title: "车", image: UIImage(named: "TabBar-发现A"), selectedImage: UIImage(named: "TabBar-发现B"))
        let rightViewTabbar = UITabBarItem(title: "神", image: UIImage(named: "tabbar-社区"), selectedImage: UIImage(named: "tabbar-社区-on"))
        
        
        rootNavigationController.tabBarItem = rootViewTabbar
        leftViewNav.tabBarItem = leftViewTabbar
        leftCenterViewNav.tabBarItem = leftCenterViewTabbar
        rightCenterViewNav.tabBarItem = rightCenterViewTabbar
        rightViewNav.tabBarItem = rightViewTabbar
        
        
        let baseTabbar = UITabBarController()
        baseTabbar.viewControllers = [leftViewNav, leftCenterViewNav, rootNavigationController, rightCenterViewNav, rightViewNav]
        baseTabbar.selectedIndex = 2
        //选中颜色
        baseTabbar.tabBar.tintColor = UIColor(red: 0.93, green: 0.35, blue: 0.25, alpha: 1)
        
        self.window!.rootViewController = baseTabbar
        self.window!.makeKeyAndVisible()
        
        return true
    }
    
    
    


    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

