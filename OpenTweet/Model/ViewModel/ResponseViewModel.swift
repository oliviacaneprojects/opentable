//
//  ResponseViewModel.swift
//  OpenTweet
//
//  Created by Olivia Cane on 5/14/19.
//  Copyright © 2019 OpenTable, Inc. All rights reserved.
//

import Foundation
import UIKit

class ResponseViewModel: NSObject {
    
    //Data for Table
    var data = [Tweet]()
    
}

extension ResponseViewModel: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: TweetCell.identifier, for: indexPath) as? TweetCell {
            //Sets cell tweet data
            cell.item = data[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
    
}
