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
    
    @IBAction func openMenu(sender: AnyObject) {
        toggleSideMenuView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SwiftLoader.show(animated: true)
        
        self.refreshControl?.addTarget(self, action: "refresh:", forControlEvents: UIControlEvents.ValueChanged)
        
        personPresenter.delegate = self
        personPresenter.getPersonCollection()
    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "segueToPersonDetail" {
            let personDetail : PersonDetailViewController = segue.destinationViewController as! PersonDetailViewController
            personDetail.person = sender as! PersonViewObject
        }
    }
    
    func refresh(sender:AnyObject)
    {
        personPresenter.getPersonCollection()
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
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let person : PersonViewObject = self.persons.objectAtIndex(indexPath.row) as! PersonViewObject
        self.performSegueWithIdentifier("segueToPersonDetail", sender: person)
    }
    
    //MARK: PersonPresenterDelegate
    func personCollectionResponse(persons: [PersonViewObject]!) {
        self.persons.removeAllObjects()
        self.persons.addObjectsFromArray(persons)
        self.tableView.reloadData()
        
        self.refreshControl?.endRefreshing()
        SwiftLoader.hide()
    }
    
    func personProfileResponse(person: PersonViewObject) {
        
    }
    
}
