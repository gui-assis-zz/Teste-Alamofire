//
//  MenuViewController.swift
//  ios-challenge
//
//  Created by Guilherme Augusto on 05/08/15.
//  Copyright (c) 2015 mobdiq. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    @IBOutlet var profilePicture: UIImageView!

    @IBOutlet var labelPhone: UILabel!
    @IBOutlet var labelLocation: UILabel!
    @IBOutlet var labelName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.profilePicture.layer.cornerRadius = self.profilePicture.bounds.size.height/2
        self.profilePicture.clipsToBounds = true
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
