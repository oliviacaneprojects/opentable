//
//  TweetCell.swift
//  OpenTweet
//
//  Created by Olivia Cane on 5/14/19.
//  Copyright © 2019 OpenTable, Inc. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {
    
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var content: UITextView!
    @IBOutlet weak var avatar: UIImageView!
    
    
    var item: Tweet? {
        didSet {
            guard  let item = item as? Tweet else {
                return
            }
            
            //Sets labels using item data 
            author.text = item.author
            date.text = DateFormat.formateShort(date: item.date)
            content.colorWord(originalText: item.content)
            
            //Downloads Image
            if let avatarString = item.avatar, !avatarString.isEmpty {
                ImageDownload.downloadFromString(imageString: avatarString, imageView: avatar)
            }
        }
    }
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        //Circular Image
        avatar.layer.cornerRadius = avatar.frame.height/2
    }
    
}
