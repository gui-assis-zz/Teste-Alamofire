//
//  Picture.swift
//  ios-challenge
//
//  Created by Guilherme Augusto on 05/08/15.
//  Copyright (c) 2015 mobdiq. All rights reserved.
//

import UIKit
import SwiftyJSON

class Picture: ResponseObjectSerializable {
    
    let large : String!
    let medium : String!
    let thumbnail : String!
    
    required init?(json: JSON) {
        self.large = json["user","picture","large"].stringValue
        self.medium = json["user","picture","medium"].stringValue
        self.thumbnail = json["user","picture","thumbnail"].stringValue
    }
    
}
