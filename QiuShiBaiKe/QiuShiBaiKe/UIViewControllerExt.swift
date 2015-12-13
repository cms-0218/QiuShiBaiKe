//
//  UIViewControllerExt.swift
//  QiuShiBaiKe
//
//  Created by andyyz on 15/12/13.
//  Copyright © 2015年 andyyz. All rights reserved.
//

import UIKit

extension UIViewController {
    
    class func showAlertView(title:String,message:String)->UIAlertController
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style:UIAlertActionStyle.Default, handler: nil)
        alert.addAction(action)
        return alert
    }

}
