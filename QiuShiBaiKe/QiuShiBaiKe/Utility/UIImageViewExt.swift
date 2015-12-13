//
//  HttpController.swift
//  QiuShiBaiKe
//
//  Created by andyyz on 15/12/13.
//  Copyright © 2015年 andyyz. All rights reserved.
//


import UIKit
import Foundation

extension UIImageView
{
    func setImage(urlString:String,placeHolder:UIImage!)
    {
        
        let url = NSURL(string: urlString)
        let cacheFilename = url!.lastPathComponent
        let cachePath = FileUtility.cachePath(cacheFilename!)
        let image : AnyObject = FileUtility.imageDataFromPath(cachePath)
        if image as! NSObject != NSNull()
        {
            self.image = image as? UIImage
        }
        else
        {
            let req = NSURLRequest(URL: url!)
            let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
            
            let task : NSURLSessionTask = session.dataTaskWithRequest(req, completionHandler: { (data, response, error) -> Void in

    
                if (error != nil)
                {
                    dispatch_async(dispatch_get_main_queue(),
                        {
                            self.image = placeHolder
                    })
                }
                else
                {
                    dispatch_async(dispatch_get_main_queue(),
                        {
                            
                            let image = UIImage(data: data!)
                            if (image == nil)
                            {
                                let jsonData = (try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers)) as! NSDictionary
                                
                                if let _:String? = jsonData["error"] as? String {
                                    print("url fail=\(urlString)");
                                }
                                self.image = placeHolder
                            }
                            else
                            {
                                self.image = image
                                let bIsSuccess = FileUtility.imageCacheToPath(cachePath,image:data!)
                                if !bIsSuccess
                                {
                                    print("*******cache fail,path=\(cachePath)")
                                }
                            }
                    })
                }
               
            })
            task.resume()
        }
        
    }
}
