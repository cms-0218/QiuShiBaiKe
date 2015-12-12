//
//  Rrefresh.swift
//  QiuShiBaiKe
//
//  Created by andyyz on 15/12/12.
//  Copyright © 2015年 andyyz. All rights reserved.
//

import UIKit



protocol RefreshViewDelegate
{
    func refreshView(refreshView:RefreshView,didClickButton btn:UIButton)
}


class RefreshView: UIView {
    
    var delegate :RefreshViewDelegate!

    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var button: UIButton!
    @IBAction func btnClicked(sender: UIButton) {
        self.delegate.refreshView(self,didClickButton:sender)
    }
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        self.indicator!.hidden = true
        
    }
    
    func startLoading()
    {
        self.button!.setTitle("", forState: .Normal)
        self.indicator!.hidden = false
        self.indicator!.startAnimating()
    }
    
    func stopLoading()
    {
        self.button!.setTitle("点击加载更多", forState: .Normal)
        self.indicator!.hidden = true
        self.indicator!.stopAnimating()
    }
    
}
