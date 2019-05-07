//
//  ViewController.swift
//  StarTrivia
//
//  Created by anna.sibirtseva on 07/05/2019.
//  Copyright © 2019 anna.sibirtseva. All rights reserved.
//

import UIKit

class SelectPersonVC: UIViewController {

    var personApi = PersonApi()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       personApi.getRandomPersonUrlSession()
    }


}

