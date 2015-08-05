//
//  MenuNavigationController.swift
//  ios-challenge
//
//  Created by Guilherme Augusto on 05/08/15.
//  Copyright (c) 2015 mobdiq. All rights reserved.
//

import UIKit

class MenuNavigationController: ENSideMenuNavigationController, ENSideMenuDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var viewController = MenuViewController(nibName: "MenuViewController", bundle: nil)
        
        sideMenu = ENSideMenu(sourceView: self.view, menuViewController: viewController, menuPosition:.Left)
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        
        sideMenu?.menuWidth = screenSize.width * 0.75
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - ENSideMenu Delegate
    func sideMenuWillOpen() {

    }
    
    func sideMenuWillClose() {

    }

}
