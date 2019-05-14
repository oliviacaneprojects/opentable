//
//  TweetViewModel.swift
//  OpenTweet
//
//  Created by Olivia Cane on 5/14/19.
//  Copyright © 2019 OpenTable, Inc. All rights reserved.
//

import Foundation
import UIKit

class TweetViewModel: NSObject {
    
    //Data for Table
    var items = [Tweet]()
    
    override init() {
        super.init()
        
        //Get the data from the .json file
        let decoder = JSONDecoder()
        guard let data = dataFromFile("timeline") else {
            return
        }
    
        
        //Decode data using Codables (Feed Type)
        do {
            let feed =  try decoder.decode(Feed.self, from: data)
            
            //Set the TweetModel tweetlist
            TweetModel.tweetlist = feed.timeline
            
            //Update items for the table
            self.items = TweetModel.tweetlist
        }
        catch {
            print("error loading data")
        }
    }

}

extension TweetViewModel: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: TweetCell.identifier, for: indexPath) as? TweetCell {
            //Sets cell tweet data
            cell.item = item
            
            return cell
        }
        
        return UITableViewCell()
    }

}
