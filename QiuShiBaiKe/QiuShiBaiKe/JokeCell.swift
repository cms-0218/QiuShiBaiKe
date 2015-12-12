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
    
    
    var data : NSDictionary!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
