//
//  PersonDetailViewController.swift
//  ios-challenge
//
//  Created by Guilherme Augusto on 05/08/15.
//  Copyright (c) 2015 mobdiq. All rights reserved.
//

import UIKit

class PersonDetailViewController: UIViewController {
    
    var person : PersonViewObject!

    @IBOutlet var imagePerson: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var phoneLabel: UILabel!
    @IBOutlet var genderLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imagePerson.loadFromUrl(person.pictureUrl, placeholder: UIImage(named: "placeholder")!)
        self.nameLabel.text = person.name
        self.emailLabel.text = person.email
        self.phoneLabel.text = person.phone
        self.genderLabel.text = person.gender
        self.addressLabel.text = person.address
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    

}
