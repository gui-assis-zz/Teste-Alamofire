//
//  Name.swift
//  ios-challenge
//
//  Created by Guilherme Augusto on 05/08/15.
//  Copyright (c) 2015 mobdiq. All rights reserved.
//

import UIKit
import SwiftyJSON

class Name: ResponseObjectSerializable {
    
    let first : String!
    let last : String!
    let title : String!
    
    required init?(json: JSON) {
        self.first = json["user", "name","first"].stringValue
        self.last = json["user", "name","last"].stringValue
        self.title = json["user", "name","title"].stringValue
    }
}
