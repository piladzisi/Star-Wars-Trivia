//
//  VehiclesVC.swift
//  StarTrivia
//
//  Created by anna.sibirtseva on 09/05/2019.
//  Copyright © 2019 anna.sibirtseva. All rights reserved.
//

import UIKit

class VehiclesVC: UIViewController, PersonProtocol {
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(person.vehicles)
    
    }
   
}
