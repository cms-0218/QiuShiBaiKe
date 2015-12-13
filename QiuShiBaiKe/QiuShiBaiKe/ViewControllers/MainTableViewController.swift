//
//  MainTableViewController.swift
//  QiuShiBaiKe
//
//  Created by andyyz on 15/12/12.
//  Copyright © 2015年 andyyz. All rights reserved.
//

import UIKit
import Foundation


enum JokeTableViewControllerType : Int {
    case HotJoke
    case NewestJoke
    case ImageTruth
    
}

class  MainTableViewController:UIViewController,UITableViewDelegate,UITableViewDataSource,RefreshViewDelegate
    
{
    
    let identifier = "JokeCellIdentifier"
    var jokeType:JokeTableViewControllerType = .HotJoke
    var tableView:UITableView?
    var dataArray = NSMutableArray()
    var page :Int = 1
    
    
    var refreshView:RefreshView?
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupViews()
        loadData()
    }
    
    override func viewWillDisappear(animated: Bool)
    {
        super.viewWillDisappear(animated)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "imageViewTapped", object:nil)
        
    }
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "imageViewTapped:", name: "imageViewTapped", object: nil)
    }
    

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
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
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        let index = indexPath.row
        let data = self.dataArray[index] as! NSDictionary
        return  JokeCell.cellHeightByData(data)
    }

    func setupViews()
    {
        let width = self.view.frame.size.width
        let height = self.view.frame.size.height
        self.tableView = UITableView(frame:CGRectMake(0,64,width,height-49-64))
        self.tableView?.delegate = self;
        self.tableView?.dataSource = self;
        self.tableView?.separatorStyle = UITableViewCellSeparatorStyle.None
        let nib = UINib(nibName:"JokeCell", bundle: nil)
        self.tableView?.registerNib(nib, forCellReuseIdentifier: identifier)
        var arr =  NSBundle.mainBundle().loadNibNamed("RrefreshView" ,owner: self, options: nil) as Array
        self.refreshView = arr[0] as? RefreshView
        self.refreshView!.delegate = self
        
        self.tableView!.tableFooterView = self.refreshView
        self.view.addSubview(self.tableView!)
    }
    
    
    func refreshView(refreshView:RefreshView,didClickButton btn:UIButton)
    {
        loadData()
    }

    func loadData()
    {
        let url = urlString()

        self.refreshView!.startLoading()
        
        HttpController.requestWithURL(url,completionHandler:{ data in
            
            if data as! NSObject == NSNull()
            {
                print("加载失败")
               // UIView.showAlertView("提示",message:"加载失败")
                return
            }
            
            let arr = data["items"] as! NSArray
            print(data)
            for data : AnyObject  in arr
            {
                self.dataArray.addObject(data)
            }
            self.tableView!.reloadData()
            self.refreshView!.stopLoading()
            self.page++
        })
    }
    
    func urlString()->String
    {
        if jokeType == .HotJoke //最热糗事
        {
            return "http://m2.qiushibaike.com/article/list/suggest?count=10&page=\(page)"
        }
        else if jokeType == .NewestJoke //最新糗事
        {
            return "http://m2.qiushibaike.com/article/list/latest?count=10&page=\(page)"
        }
        else//有图有真相
        {
            return "http://m2.qiushibaike.com/article/list/imgrank?count=10&page=\(page)"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   

    
    
    

}