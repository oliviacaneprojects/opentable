//
//  Tweet.swift
//  OpenTweet
//
//  Created by Olivia Cane on 5/14/19.
//  Copyright © 2019 OpenTable, Inc. All rights reserved.
//

import Foundation

struct Feed: Codable {
    let timeline: [Tweet]
    
    enum CodingKeys: String, CodingKey {
        case timeline
    }
}

struct Tweet: Codable {
    let id: String
    let author: String
    let content: String
    let date: String
    let avatar: String?
    let inReplyTo: String?
 
    enum CodingKeys: String, CodingKey {
        case id
        case author
        case content
        case date
        case avatar
        case inReplyTo
       
    }
}
