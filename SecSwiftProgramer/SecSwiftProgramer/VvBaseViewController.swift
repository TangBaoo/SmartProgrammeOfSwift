//
//  VvBaseViewController.swift
//  SecSwiftProgramer
//
//  Created by Pis on 16/7/25.
//  Copyright © 2016年 Kz. All rights reserved.
//

import UIKit

class VvBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 基类viewcontroller
        self.view.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        // push后的页面navigationlbackitem 不显示文字
        let item = UIBarButtonItem(title: "", style: .Plain, target: self, action: nil)
        navigationItem.backBarButtonItem = item;
        // Do any additional setup after loading the view.
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
