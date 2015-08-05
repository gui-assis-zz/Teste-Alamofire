//
//  PersonPresenter.swift
//  ios-challenge
//
//  Created by Guilherme Augusto on 05/08/15.
//  Copyright (c) 2015 mobdiq. All rights reserved.
//

import UIKit

protocol PersonPresenterDelegate{
    func personCollectionResponse(persons: [PersonViewObject]!) -> Void
}

protocol PersonPresenterProfileDelegate: PersonPresenterDelegate {
    func personProfileResponse(profilePictureUrl: String!, profileName: String, profileLocation: String, profilePhone: String) -> Void
}


class PersonPresenter: NSObject, PersonServiceDelegate {
    
    var delegate : PersonPresenterDelegate?
    
    let personService = PersonService()
    
    override init() {
        super.init()
        personService.delegate = self
    }
    
    func getLoggedUserProfile() -> Void {
        personService.getPersonObject()
    }
    
    func getPersonCollection() -> Void {
        personService.getPersonCollection()
    }
    
    //MARK: PersonServiceDelegate
    
    func userResponse(user: User) {
        (self.delegate! as! PersonPresenterProfileDelegate).personProfileResponse(user.picture.thumbnail, profileName: user.name.first, profileLocation: user.location.city, profilePhone: user.phone)
    }
    
    func userCollectionResponse(userCollection: [User]) {
        
        var arrayPersonViewObjects : NSMutableArray = NSMutableArray()
        
        for user in userCollection {
            let name = String(format: "%@ %@ %@", user.name.title, user.name.first, user.name.last)
            arrayPersonViewObjects.addObject(PersonViewObject(thumbnailUrl: user.picture.thumbnail, name: name))
        }
        
        let array = NSArray(array: arrayPersonViewObjects) as! [PersonViewObject]
        
        self.delegate!.personCollectionResponse(array)
    }
}
