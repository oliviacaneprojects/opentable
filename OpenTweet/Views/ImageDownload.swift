//
//  ImageDownload.swift
//  OpenTweet
//
//  Created by Olivia Cane on 5/14/19.
//  Copyright © 2019 OpenTable, Inc. All rights reserved.
//

import Foundation
import UIKit

class ImageDownload {
    
    //Download Image from URL String and Update UI on main thread
    static func downloadFromString(imageString: String, imageView: UIImageView) {
            let url = URL(string: imageString)
            URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
                if let error = error {
                    print(error)
                }
                else{
                    //Main Thread
                    DispatchQueue.main.async {
                        //Update Image
                        imageView.image = UIImage(data: data!)
                    }
                }
            }).resume()
        }
}

