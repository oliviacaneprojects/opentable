//
//  TweetResponseViewController.swift
//  OpenTweet
//
//  Created by Olivia Cane on 5/14/19.
//  Copyright © 2019 OpenTable, Inc. All rights reserved.
//

import UIKit

class TweetResponseViewController: UIViewController {
    
    //TableView Model
    fileprivate let viewModel = ResponseViewModel()
    
    var tweet: Tweet?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var noResponseLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set view title
        title = "Response"
        
        //Get rid of extra cells at bottom of table view
        tableView.tableFooterView = UIView()
        
        //Add data to viewModel
        loadData()
        
        //Set TableView Data Source
        tableView.dataSource = viewModel
        
        //Register Cells from XIB files
        tableView?.register(TweetCell.nib, forCellReuseIdentifier: TweetCell.identifier)
        
    }

    //Add data to viewmodel for tableview
    func loadData() {
        
        //Replying to Other Tweet
        //Show the original tweet and the tapped tweet
        if let tweetReply = tweet?.inReplyTo {
            
            //Find original tweet
            let originalTweet = TweetModel.tweetlist.filter( {
                return self.tweet?.inReplyTo == $0.id
            })
    
            //Set data with two tweets
            viewModel.data = [originalTweet[0] , tweet] as! [Tweet]
            
        }
        //First Tweet in Thread
        //Show all tweets that responded to the tweet
        else {
            
            //Use filter to find tweets in TweetModel that responded
            viewModel.data = TweetModel.tweetlist.filter( {(tweetCheck: Tweet) -> Bool in
                if let tweetReply = tweetCheck.inReplyTo, tweetReply == self.tweet!.id {
                    return true
                }
                return false })
        }
        
        
        //No Response Label if no tweet data to show
        if viewModel.data.count == 0 {
            noResponseLabel.text = "No Responses Yet"
        }
        
    }
    
}
