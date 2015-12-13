//
//  aboutViewController.swift
//  QiuShiBaiKe
//
//  Created by andyyz on 15/12/12.
//  Copyright © 2015年 andyyz. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    
    @IBAction func followMe()
    {
        let urlString = "http://weibo.com/yangreal"
        let url =  NSURL(string: urlString)
        UIApplication.sharedApplication().openURL(url!)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

