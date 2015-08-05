//
//  PersonService.swift
//  ios-challenge
//
//  Created by Guilherme Augusto on 05/08/15.
//  Copyright (c) 2015 mobdiq. All rights reserved.
//

import UIKit
import Alamofire

class PersonService: NSObject {

    class func getPersonsFromServer(quant: String) -> Void{
        
        Alamofire.request(.GET, String(format: "http://api.randomuser.me/?results=%@", quant)) 
            .responseJSON { _, _, JSON, _ in
                println(JSON)
        }
        
    }
    
}
