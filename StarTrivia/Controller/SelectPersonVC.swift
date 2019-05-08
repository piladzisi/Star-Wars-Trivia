//
//  ViewController.swift
//  StarTrivia
//
//  Created by anna.sibirtseva on 07/05/2019.
//  Copyright © 2019 anna.sibirtseva. All rights reserved.
//

import UIKit

class SelectPersonVC: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    @IBOutlet weak var hairLabel: UILabel!
    @IBOutlet weak var birthYearLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    
    var personApi = PersonApi()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //step 1: make networking request
       personApi.getRandomPersonUrlSession()
        //
    }


}

