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
    func personProfileResponse(person: PersonViewObject) -> Void
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
    
    func personViewObjectFromUser(user: User) -> PersonViewObject {
        let name = String(format: "%@ %@ %@", user.name.title, user.name.first, user.name.last)
        let address = String(format: "%@, %@ - %@", user.location.street, user.location.city, user.location.state)
        let email = user.email
        let phone = user.phone
        let gender = user.gender
        let pictureUrl = user.picture.large
        let thumbnailUrl = user.picture.thumbnail
        
        return PersonViewObject(thumbnailUrl: thumbnailUrl, name: name, address: address, email: email, phone: phone, gender: gender, pictureUrl: pictureUrl)
    }
    
    //MARK: PersonServiceDelegate
    func userResponse(user: User) {
        self.delegate!.personProfileResponse(personViewObjectFromUser(user))
    }
    
    func userCollectionResponse(userCollection: [User]) {
        
        var arrayPersonViewObjects : NSMutableArray = NSMutableArray()
        
        for user in userCollection {
            arrayPersonViewObjects.addObject(personViewObjectFromUser(user))
        }
        
        let array = NSArray(array: arrayPersonViewObjects) as! [PersonViewObject]
        
        var sortedArray = sorted(array) {
            (obj1, obj2) in
            
            // The downcast to Person is only needed if persons is an NSArray or a Swift Array of AnyObjects
            let p1 = obj1 as PersonViewObject
            let p2 = obj2 as PersonViewObject
            
            return p1.name < p2.name
        }
        
        self.delegate!.personCollectionResponse(sortedArray)
    }
}
