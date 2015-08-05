//
//  Location.swift
//  ios-challenge
//
//  Created by Guilherme Augusto on 05/08/15.
//  Copyright (c) 2015 mobdiq. All rights reserved.
//

import UIKit
import SwiftyJSON

final class Location: ResponseObjectSerializable {
    
    let city : String!
    let state : String!
    let street : String!
    let zip : String!
    
    required init?(json: JSON) {
        self.city = json["user","location","city"].stringValue
        self.state = json["user","location","state"].stringValue
        self.street = json["user","location","street"].stringValue
        self.zip = json["user","location","zip"].stringValue
    }
}
