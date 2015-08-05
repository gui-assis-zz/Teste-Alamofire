//
//  UserViewObject.swift
//  ios-challenge
//
//  Created by Guilherme Augusto on 05/08/15.
//  Copyright (c) 2015 mobdiq. All rights reserved.
//

import UIKit

class PersonViewObject: NSObject {
    var thumbnailUrl : String
    var name : String
    
    init(thumbnailUrl: String, name: String) {
        
        self.thumbnailUrl = thumbnailUrl
        self.name = name
        
        super.init()
        
    }
}
