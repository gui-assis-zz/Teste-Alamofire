//
//  UserViewObject.swift
//  ios-challenge
//
//  Created by Guilherme Augusto on 05/08/15.
//  Copyright (c) 2015 mobdiq. All rights reserved.
//

import UIKit

class PersonViewObject: NSObject {
    
    var name : String
    var address : String
    var email : String
    var phone : String
    var gender : String
    var pictureUrl : String
    var thumbnailUrl : String
    
    init(thumbnailUrl: String, name: String, address: String, email: String, phone: String, gender: String, pictureUrl: String) {
        
        self.name = name
        self.address = address
        self.email = email
        self.phone = phone
        self.gender = gender
        self.pictureUrl = pictureUrl
        self.thumbnailUrl = thumbnailUrl
        
        super.init()
    }
}
