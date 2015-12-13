//
//  JokeCell.swift
//  QiuShiBaiKe
//
//  Created by andyyz on 15/12/12.
//  Copyright © 2015年 andyyz. All rights reserved.
//

import UIKit

class JokeCell : UITableViewCell {
    
    @IBOutlet weak var headView: UIImageView!
    @IBOutlet weak var picView: UIImageView!
    @IBOutlet weak var nickLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var dislikeLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    @IBOutlet weak var bottomView: UIView!
    
    var data : NSDictionary!
    var largeImageURL:String = ""
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .None
        
        let tap = UITapGestureRecognizer(target: self, action: "imageViewTapped:")
        self.picView!.addGestureRecognizer(tap)
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
        
        guard ((self.data) != nil) else{
            return;
        }
        
        let user:AnyObject?  = self.data["user"]
        
        //if user as! NSObject != NSNull()
        if let userDictOp:NSDictionary = user as? NSDictionary
        {
            let userDict = userDictOp
            self.nickLabel!.text = userDict["login"] as! String?
            let icon : AnyObject! = userDict["icon"] //as NSString
            if icon as! NSObject != NSNull()
            {
                let userIcon = icon as! String
                if let idNumber = userDict["id"] as? NSNumber {
                    let userId = idNumber.stringValue as NSString
                    let prefixUserId = userId.substringToIndex(userId.length - 4)
                    let userImageURL = "http://pic.qiushibaike.com/system/avtnew/\(prefixUserId)/\(userId)/medium/\(userIcon)"
                    self.headView!.setImage(userImageURL,placeHolder: UIImage(named: "avatar.jpg"))
                }
                
            }
            else
            {
                self.headView!.image =  UIImage(named: "avatar.jpg")
            }
        }
        else
        {
            self.nickLabel!.text = "匿名"
            self.headView!.image =  UIImage(named: "avatar.jpg")
            
        }
        let content = self.data.stringAttributeForKey("content")
        let height = content.stringHeightWith(17,width:300)
        self.contentLabel!.setHeight(height)
        self.contentLabel.numberOfLines = 0
        self.contentLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        self.contentLabel!.text = content

        
        let imgSrc = self.data.stringAttributeForKey("image") as NSString
        if imgSrc.length == 0
        {
            self.picView!.hidden = true
            self.bottomView!.setY(self.contentLabel!.bottom())
        }
        else
        {
            let imageId = self.data.stringAttributeForKey("id") as NSString
            let prefiximageId = imageId.substringToIndex(imageId.length - 4)
            let imagURL = "http://pic.qiushibaike.com/system/pictures/\(prefiximageId)/\(imageId)/small/\(imgSrc)"
            self.picView!.hidden = false
            self.picView!.setImage(imagURL,placeHolder: UIImage(named: "avatar.jpg"))
            self.largeImageURL = "http://pic.qiushibaike.com/system/pictures/\(prefiximageId)/\(imageId)/medium/\(imgSrc)"
            self.picView!.setY(self.contentLabel!.bottom()+5)
            self.bottomView!.setY(self.picView!.bottom())
        }
        
        let votes :AnyObject!  = self.data["votes"]
        if votes as! NSObject == NSNull()
        {
            self.likeLabel!.text = "顶(0)"
            self.dislikeLabel!.text = "踩(0)"
            // self.likeLabel!.text = "评论(0)"
        }
        else
        {
            let votesDict = votes as! NSDictionary
            let like  = votesDict.stringAttributeForKey("up") as String
            let disLike  = votesDict.stringAttributeForKey("down") as String
            self.likeLabel!.text = "顶(\(like))"
            self.dislikeLabel!.text = "踩(\(disLike))"
        }//comments_count
        let commentCount = self.data.stringAttributeForKey("comments_count") as String
        self.commentLabel!.text = "评论(\(commentCount))"
        
    }
    
    
    class func cellHeightByData(data:NSDictionary)->CGFloat
    {
        let content = data.stringAttributeForKey("content")
        let height = content.stringHeightWith(17,width:300)
        let imgSrc = data.stringAttributeForKey("image") as NSString
        if imgSrc.length == 0
        {
            return 59.0 + height + 40.0
        }
        return 59.0 + height + 5.0 + 112.0 + 40.0
    }
    
    func imageViewTapped(sender:UITapGestureRecognizer)
    {
        NSNotificationCenter.defaultCenter().postNotificationName("imageViewTapped", object:self.largeImageURL)
        
    }
    

    
}
