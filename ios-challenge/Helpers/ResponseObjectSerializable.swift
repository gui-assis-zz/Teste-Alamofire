//
//  ResponseObjectSerializable.swift
//  ios-challenge
//
//  Created by Guilherme Augusto on 05/08/15.
//  Copyright (c) 2015 mobdiq. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

public protocol ResponseObjectSerializable {
    init?(json : JSON)
}

extension Request {
    
    public func responseObject<T: ResponseObjectSerializable>(completionHandler: (NSURLRequest, NSHTTPURLResponse?, T?, NSError?) -> Void) -> Self {
        let responseSerializer = GenericResponseSerializer<T> { request, response, data in
            let jsonData = JSON(data: data!)
            return (T(json: jsonData["results", 0]), nil)
        }
        
        return response(responseSerializer: responseSerializer, completionHandler: completionHandler)
    }
}