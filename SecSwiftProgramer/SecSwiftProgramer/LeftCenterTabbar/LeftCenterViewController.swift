//
//  LeftCenterViewController.swift
//  SecSwiftProgramer
//
//  Created by Pis on 16/7/25.
//  Copyright © 2016年 Kz. All rights reserved.
//

import UIKit

class LeftCenterViewController: VvBaseViewController, UIWebViewDelegate {

    var webVView: UIWebView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "明"
        // Do any additional setup after loading the view.
        
        
        // 与OC混编 添加桥接文件 就可直接用  如下方AFN
//        let afn = AFHTTPSessionManager(baseURL: NSURL?, sessionConfiguration: NSURLSessionConfiguration?)
        
        self.webVView = UIWebView()
        self.view.addSubview(self.webVView!)
        self.webVView?.snp_makeConstraints(closure: { (make) in
            make.edges.equalTo(EdgeInsetsMake(0, left: 0, bottom: 0, right: 0))
        })
        
        self.webVView?.delegate = self;
        let urlStr = NSURL(string: "http://www.bilibili.com/")
        let request = NSURLRequest(URL: urlStr!)
        self.webVView?.loadRequest(request)
        
        
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        // 读取网页操作时候的信息
        let rurl =  request.URL?.absoluteString
        print(rurl)
        
        return true
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        
        // js交互
        let context = self.webVView?.valueForKeyPath("documentView.webView.mainFrame.javaScriptContext")
        print(context)
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
