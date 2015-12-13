//
//  HttpController.swift
//  QiuShiBaiKe
//
//  Created by andyyz on 15/12/13.
//  Copyright © 2015年 andyyz. All rights reserved.
//


import UIKit
import Foundation
extension NSDictionary {
    
    
    func stringAttributeForKey(key:String)->String
    {
        //println(self[key])
        
        let obj:AnyObject?  = self[key]
        //if obj as! NSObject == NSNull()
        if let _ = obj as? NSObject
        {
            //return ""
        } else {
            return ""
        }
        if obj!.isKindOfClass(NSNumber)
        {
            let num = obj as! NSNumber
            return num.stringValue
        }
        if let _ = obj as? String
        {
            return obj as! String
        }
        return ""
    }
    
}
