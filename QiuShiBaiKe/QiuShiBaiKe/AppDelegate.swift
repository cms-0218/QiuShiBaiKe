//
//  AppDelegate.swift
//  QiuShiBaiKe
//
//  Created by andyyz on 15/12/12.
//  Copyright © 2015年 andyyz. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        // Override point for customization after application launch.
        let mainViewController = MainViewController(nibName:nil,  bundle: nil)
        let navigationViewController = UINavigationController(rootViewController: mainViewController)
        
        self.window!.rootViewController = navigationViewController
        self.window!.backgroundColor = UIColor.whiteColor()
        self.window!.makeKeyAndVisible()
        return true

    }

  

}

