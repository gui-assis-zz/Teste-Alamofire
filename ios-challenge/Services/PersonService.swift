//
//  PersonService.swift
//  ios-challenge
//
//  Created by Guilherme Augusto on 05/08/15.
//  Copyright (c) 2015 mobdiq. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


protocol PersonServiceDelegate{
    func userResponse(user: User) -> Void
    func userCollectionResponse(userCollection: [User]) -> Void
}

class PersonService: NSObject {
    
    var delegate : PersonServiceDelegate?
    
    override init() { super.init() }
    
    init(delegate: PersonServiceDelegate) {
        self.delegate = delegate
    }

    func getPersonCollection() -> Void {
        Alamofire.request(.GET, "http://api.randomuser.me/?results=100")
            .responseCollection { (_, _, users: [User]?, _) in
                self.delegate!.userCollectionResponse(users!)
        }
        
    }
    
    func getPersonObject() -> Void {
        Alamofire.request(.GET, "http://api.randomuser.me")
            .responseObject { (_, _, user: User?, _) in
                self.delegate!.userResponse(user!)
        }
    }
    
}
