//
//  UIImageViewAsync.swift
//  ios-challenge
//
//  Created by Guilherme Augusto on 05/08/15.
//  Copyright (c) 2015 mobdiq. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func getDataFromUrl(url:String, completion: ((data: NSData?) -> Void)) {
        NSURLSession.sharedSession().dataTaskWithURL(NSURL(string: url)!) { (data, response, error) in
            completion(data: NSData(data: data))
            }.resume()
    }
    
    func loadFromUrl(url:String, placeholder: UIImage){
        self.image = placeholder
        
        getDataFromUrl(url) { data in
            dispatch_async(dispatch_get_main_queue()) {
                self.image = UIImage(data: data!)
            }
        }
    }

}