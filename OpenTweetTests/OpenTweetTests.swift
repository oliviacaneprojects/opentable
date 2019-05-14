//
//  OpenTweetTests.swift
//  OpenTweetTests
//
//  Created by Olivier Larivain on 9/30/16.
//  Copyright © 2016 OpenTable, Inc. All rights reserved.
//

import XCTest
@testable import OpenTweet

class OpenTweetTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    //Checks if date is formatted correctly
    func testDateFormat() {
         let formattedDate = DateFormat.formateShort(date: "2016-09-30T10:33:00-08:00")
         XCTAssertEqual(formattedDate, "09/30/2016")
    }
    
    
    
}
