//
//  HttpController.swift
//  QiuShiBaiKe
//
//  Created by andyyz on 15/12/13.
//  Copyright © 2015年 andyyz. All rights reserved.
//

import Foundation
import UIKit



class HttpController: NSObject {
    
    override init()
    {
        super.init();
    }
    
    class func requestWithURL(urlString:String,completionHandler:(data:AnyObject)->Void)
    {
        let URL = NSURL(string: urlString);
        let req = NSURLRequest(URL: URL!)
        //let queue = NSOperationQueue();
        
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        
      
        let task : NSURLSessionTask = session.dataTaskWithRequest(req, completionHandler: { (data, response, error) -> Void in
            
            if(error != nil)
            {
                dispatch_async(dispatch_get_main_queue(),
                    {
                        print(error)
                        completionHandler(data:NSNull())
                })

            }
            else
            {
                let jsonData = (try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers)) as! NSDictionary
                
                dispatch_async(dispatch_get_main_queue(),
                    {
                        completionHandler(data:jsonData)
                        
                })

            }
        })
        task.resume()
    }
    
}
