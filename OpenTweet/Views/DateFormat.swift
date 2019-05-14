//
//  NSDate + Extension.swift
//  OpenTweet
//
//  Created by Olivia Cane on 5/14/19.
//  Copyright © 2019 OpenTable, Inc. All rights reserved.
//

import UIKit
 
class DateFormat{
    
    //Formats From JSON date format to MM/dd/yyyy 
    static func formateShort(date: String) -> String {
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss-HH:mm"
        if let dateObj = dateFormatter.date(from: date) {
             dateFormatter.dateFormat = "MM/dd/yyyy"
            return dateFormatter.string(from: dateObj)
        }
        return ""
    }
}
