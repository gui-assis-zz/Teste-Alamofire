//
//  PersonListViewController.swift
//  ios-challenge
//
//  Created by Guilherme Augusto on 04/08/15.
//  Copyright (c) 2015 mobdiq. All rights reserved.
//

import UIKit

class PersonListViewController: UITableViewController, PersonPresenterDelegate {
    
    var persons : NSMutableArray = NSMutableArray()
    let personPresenter = PersonPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        personPresenter.delegate = self
        personPresenter.getPersonCollection()
    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: PersonCell = tableView.dequeueReusableCellWithIdentifier("PersonCell", forIndexPath:indexPath) as! PersonCell
        
        let person : PersonViewObject = self.persons.objectAtIndex(indexPath.row) as! PersonViewObject
        
        cell.labelPersonName.text = person.name
        cell.imagePerson.loadFromUrl(person.thumbnailUrl, placeholder: UIImage(named: "placeholder")!)
        
        return cell
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    //MARK: PersonPresenterDelegate
    func personCollectionResponse(persons: [PersonViewObject]!) {
        self.persons.addObjectsFromArray(persons)
        self.tableView.reloadData()
    }
    
}
