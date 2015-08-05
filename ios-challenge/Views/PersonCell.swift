//
//  PersonCell.swift
//  ios-challenge
//
//  Created by Guilherme Augusto on 04/08/15.
//  Copyright (c) 2015 mobdiq. All rights reserved.
//

import UIKit

class PersonCell: UITableViewCell {
    
    @IBOutlet var labelPersonName: UILabel!
    @IBOutlet var imagePerson: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.imagePerson.layer.cornerRadius = self.imagePerson.bounds.size.height/2
        self.imagePerson.clipsToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
