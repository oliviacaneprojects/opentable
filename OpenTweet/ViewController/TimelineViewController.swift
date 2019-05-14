//
//  ViewController.swift
//  OpenTweet
//
//  Created by Olivier Larivain on 9/30/16.
//  Copyright © 2016 OpenTable, Inc. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController{
    
    //TableView Model 
    fileprivate let viewModel = TweetViewModel()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
		super.viewDidLoad()
        
        //Set Title
        title = "Home"
        
        //Set TableView Data Source + Delegate
        tableView.dataSource = viewModel
        tableView.delegate = self
        
        //Get rid of extra cells at bottom of table view
        tableView.tableFooterView = UIView()
        
        //Register Cells from XIB files
        tableView?.register(TweetCell.nib, forCellReuseIdentifier: TweetCell.identifier)
	}

    func navigateResponseViewController(tweet: Tweet) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "response") as? TweetResponseViewController
        vc?.tweet = tweet
        self.navigationController?.pushViewController(vc!, animated: true)
    }

}

extension TimelineViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         navigateResponseViewController(tweet: TweetModel.tweetlist[indexPath.row])
    }
}

