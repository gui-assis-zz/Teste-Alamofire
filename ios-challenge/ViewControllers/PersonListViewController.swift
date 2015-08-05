//
//  PersonListViewController.swift
//  ios-challenge
//
//  Created by Guilherme Augusto on 04/08/15.
//  Copyright (c) 2015 mobdiq. All rights reserved.
//

import UIKit

class PersonListViewController: UITableViewController {
    
    var personsSections : NSMutableDictionary!
    var persons : NSMutableArray!

    override func viewDidLoad() {
        super.viewDidLoad()
        PersonService.getPersonsFromServer("2")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

}
