//
//  Person.swift
//  ios-challenge
//
//  Created by Guilherme Augusto on 04/08/15.
//  Copyright (c) 2015 mobdiq. All rights reserved.
//

import UIKit
import SwiftyJSON

final class User: ResponseObjectSerializable, ResponseCollectionSerializable {
    
    let name : Name
    let location : Location
    let picture : Picture
    let email : String!
    let phone : String!
    let gender : String!
    
    required init?(json: JSON) {
        self.email = json["user","email"].stringValue
        self.phone = json["user", "phone"].stringValue
        self.gender = json["user", "gender"].stringValue
        
        self.name = Name(json: json)!
        self.location = Location(json: json)!
        self.picture = Picture(json: json)!
    }
    
    static func collection(json: JSON) -> [User] {
        var users: [User] = []
        
        for (index: String, subJson: JSON) in json["results"] {            
            let user = User(json: subJson)
            users.append(user!)
        }
        
        return users
    }
    
}