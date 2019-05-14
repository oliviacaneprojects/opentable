//
//  TextView + Ex.swift
//  OpenTweet
//
//  Created by Olivia Cane on 5/14/19.
//  Copyright © 2019 OpenTable, Inc. All rights reserved.
//

import UIKit

extension UITextView {
    
    //Colors all words that start with the @ symbol
    func colorWord(originalText: String) {
        let wordToColor = originalText.colorWords()
        let attributedOriginalText = NSMutableAttributedString(string: originalText)
        
        for word in wordToColor {
            let linkRange = attributedOriginalText.mutableString.range(of: word)
            attributedOriginalText.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.blue, range: linkRange)
        }
        let fullRange = NSMakeRange(0, attributedOriginalText.length)
    
        self.attributedText = attributedOriginalText
}
}
