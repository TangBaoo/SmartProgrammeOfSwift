//
//  ViewController.swift
//  SecSwiftProgramer
//
//  Created by Pis on 16/7/15.
//  Copyright © 2016年 Kz. All rights reserved.
//

import UIKit


let MAINWIDTH = UIScreen.mainScreen().bounds.width
let MAINHEIGHT = UIScreen.mainScreen().bounds.height


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView?
    var myIndex: NSIndexPath?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        title = "山"
        self.view.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        
        self.tableView = UITableView(frame: CGRectZero, style: UITableViewStyle.Grouped)
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        self.view.addSubview(self.tableView!)
        
        // push后的页面navigationlbackitem 不显示文字
        let item = UIBarButtonItem(title: "", style: .Plain, target: self, action: nil)
        self.navigationItem.backBarButtonItem = item;
        self.tableView?.snp_makeConstraints(closure: { (make) in

            make.edges.equalTo(self.view).inset(UIEdgeInsetsZero)
        })
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let initIdentf = "Cell"
        let cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: initIdentf)
        
        cell.textLabel!.text = "Section: \(indexPath.section) Row: \(indexPath.row)"
        cell.detailTextLabel!.text = "点击"
        cell.imageView!.image = UIImage(named: "母婴考试")
        
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let vc = FirstViewController()
        
        // 传递对应方法地址过去
        vc.initWithClosure(PP)
        self.myIndex = indexPath
        
        vc.hidesBottomBarWhenPushed = true
        
        self.navigationController!.pushViewController(vc, animated: true)
    }
    
    
    
    // 闭包方法
    func PP(Str:String){
        print(Str)
        
        let cccc = self.tableView!.cellForRowAtIndexPath(self.myIndex!)
        cccc!.textLabel!.text = Str
        cccc!.imageView!.image = UIImage(named: "icossssn.jpg")
        cccc!.detailTextLabel!.text = "点过了"
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

