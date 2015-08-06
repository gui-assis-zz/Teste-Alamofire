//
//  MenuViewController.swift
//  ios-challenge
//
//  Created by Guilherme Augusto on 05/08/15.
//  Copyright (c) 2015 mobdiq. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, PersonPresenterDelegate {
    
    @IBOutlet var profilePicture: UIImageView!
    @IBOutlet var labelPhone: UILabel!
    @IBOutlet var labelLocation: UILabel!
    @IBOutlet var labelName: UILabel!
    
    let personPresenter = PersonPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        personPresenter.delegate = self
        personPresenter.getLoggedUserProfile()

        self.profilePicture.layer.cornerRadius = self.profilePicture.bounds.size.height/2
        self.profilePicture.clipsToBounds = true
    }

    func personProfileResponse(person: PersonViewObject) {
        self.profilePicture.loadFromUrl(person.thumbnailUrl, placeholder: UIImage(named: "placeholder")!)
        self.labelPhone.text = person.phone
        self.labelLocation.text = person.address
        self.labelName.text = person.name
    }
    
    func personCollectionResponse(persons: [PersonViewObject]!) {
        
    }
    
}
