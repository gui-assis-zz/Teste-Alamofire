//
//  ResponseCollectionSerializable.swift
//  ios-challenge
//
//  Created by Guilherme Augusto on 05/08/15.
//  Copyright (c) 2015 mobdiq. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

public protocol ResponseCollectionSerializable {
    static func collection(json: JSON) -> [Self]
}

extension Alamofire.Request {
    public func responseCollection<T: ResponseCollectionSerializable>(completionHandler: (NSURLRequest, NSHTTPURLResponse?, [T]?, NSError?) -> Void) -> Self {
        let responseSerializer = GenericResponseSerializer<[T]> { request, response, data in
            let jsonData = JSON(data: data!)
            return (T.collection(jsonData), nil)
        }
        
        return response(responseSerializer: responseSerializer, completionHandler: completionHandler)
    }
}