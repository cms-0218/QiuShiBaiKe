//
//  MainTableViewController.swift
//  QiuShiBaiKe
//
//  Created by andyyz on 15/12/12.
//  Copyright © 2015年 andyyz. All rights reserved.
//

import UIKit


enum YRJokeTableViewControllerType : Int {
    case HotJoke
    case NewestJoke
    case ImageTruth
    
}

class  MainTableViewController:UIViewController,UITableViewDelegate,UITableViewDataSource
    
{
    
    let identifier = "YRJokeCellIdentifier"
    var jokeType:YRJokeTableViewControllerType = .HotJoke
    var tableView:UITableView?
    var dataArray = NSMutableArray()
    var page :Int = 1
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  self.dataArray.count;
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath) as? JokeCell
        let index = indexPath.row
        let data = self.dataArray[index] as! NSDictionary
        cell!.data = data
        return cell!;
    }
    

}