//
//  LeftTabbarViewController.swift
//  SecSwiftProgramer
//
//  Created by Pis on 16/7/25.
//  Copyright © 2016年 Kz. All rights reserved.
//

import UIKit

class LeftTabbarViewController: VvBaseViewController {

     
    
     override func viewDidLoad() {
          
          super.viewDidLoad()
          
          title = "秋"
          
          // Do any additional setup after loading the view.
          
          
          let label1 = UILabel(frame: CGRectMake(40,100,MAINWIDTH - 80,60))
          label1.text = "这页直接去看代码吧\n在LeftTabbarViewController"
          label1.font = UIFont.systemFontOfSize(16)
          label1.numberOfLines = 0
          label1.textAlignment = .Center
          label1.textColor = UIColor.blackColor()
          self.view.addSubview(label1)
          
          // 懒得加注释了 直接看控制台结果就懂了
          var mostArray = [1,2,3,4,5]
          
          func AddInt(i: NSInteger) -> NSInteger{
               
               return i + 10
          }
          
          let mapArray = mostArray.map(AddInt)
          print("\(mapArray) \n")
          
          
          for ii in mostArray{
               print(ii)
          }
          
          let newArray = NSMutableArray()
          for ii: NSInteger in 1...15 {
               newArray.addObject(ii)
          }
          print(newArray)
          
          
          func arraySum(i: NSInteger, j: NSInteger) -> NSInteger {
               
               return i + j
          }
          print("\n\(mapArray.reduce(0, combine: arraySum))")
          print("\n\(mostArray.reduce(1, combine: *))")
          
          
          
          let str1 = "my name is"
          let str2 = " GuanTangBao"
          let str3 = str1 + str2
          print("\n\(str3)")
          print("\n\(str3.uppercaseString)")
          print("\n\(str3.lowercaseString)")
          
          
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
