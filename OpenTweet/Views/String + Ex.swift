//
//  String + Ex.swift
//  OpenTweet
//
//  Created by Olivia Cane on 5/14/19.
//  Copyright © 2019 OpenTable, Inc. All rights reserved.
//

import Foundation

extension String
{
    //Returns array of words that start with the @ symbol
    func colorWords() -> [String]
    {
        if let regex = try? NSRegularExpression(pattern: "@[a-z0-9_]+", options: .caseInsensitive)
        {
            let string = self as NSString
            
            return regex.matches(in: self, options: [], range: NSRange(location: 0, length: string.length)).map {
                        string.substring(with: $0.range)
            }
        }
        
        return []
    }
}
