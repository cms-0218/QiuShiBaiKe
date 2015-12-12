//
//  FileUtility.swift
//  QiuShiBaiKe
//
//  Created by andyyz on 15/12/12.
//  Copyright © 2015年 andyyz. All rights reserved.
//

import UIKit

class FileUtility: NSObject {

    class func cachePath(fileName:String)->String
    {
        var arr =  NSSearchPathForDirectoriesInDomains(.CachesDirectory, .UserDomainMask, true)
        let path = arr[0]
        return "\(path)/\(fileName)"
    }
    
    
    class func imageCacheToPath(path:String,image:NSData)->Bool
    {
        return image.writeToFile(path, atomically: true)
    }
    
    class func imageDataFromPath(path:String)->AnyObject
    {
        let exist = NSFileManager.defaultManager().fileExistsAtPath(path)
        if exist
        {
            _ = NSData(contentsOfFile: path);
            let img = UIImage(contentsOfFile: path)
            
            let url:NSURL? = NSURL.fileURLWithPath(path)
            let dd = NSFileManager.defaultManager().contentsAtPath(url!.path!)
            _ = UIImage(data:dd!)
            
            if img != nil {
                return img!
            } else {
                return NSNull()
            }
        }
        return NSNull()
    }
}
