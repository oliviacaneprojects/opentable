//
//  TwitterClient.swift
//  OpenTweet
//
//  Created by Olivia Cane on 5/14/19.
//  Copyright © 2019 OpenTable, Inc. All rights reserved.
//

import Foundation


//Loads Data from Json File 
public func dataFromFile(_ filename: String) -> Data? {
    @objc class TweetClass: NSObject { }
    
    let bundle = Bundle(for: TweetClass.self)
    if let path = bundle.path(forResource: filename, ofType: "json") {
        return (try? Data(contentsOf: URL(fileURLWithPath: path)))
    }
    return nil
}
