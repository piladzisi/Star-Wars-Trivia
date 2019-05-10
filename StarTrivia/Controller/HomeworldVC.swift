//
//  HomeworldVC.swift
//  StarTrivia
//
//  Created by anna.sibirtseva on 09/05/2019.
//  Copyright © 2019 anna.sibirtseva. All rights reserved.
//

import UIKit

class HomeworldVC: UIViewController, PersonProtocol {
    
    @IBOutlet weak var hwnameLabel: UILabel!
    @IBOutlet weak var hwclimateLabel: UILabel!
    @IBOutlet weak var hwterrainLabel: UILabel!
    @IBOutlet weak var hwpopulationLabel: UILabel!
    
    var person: Person!
    var homeworld: Homeworld!
    var homeworldApi = HomeworldApi()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = person.homeworld
        homeworldApi.getHomeworld(url: url) { (res) in
            switch res {
            case .success(let homeworld):
               self.setupView(homeworld: homeworld)
                 self.homeworld = homeworld
            case .failure(let err):
                print("Failed to fetch homeworld:", err)
            }
        }
    }
    
    func setupView(homeworld: Homeworld) {
        hwnameLabel.text = homeworld.name
        hwclimateLabel.text = homeworld.climate
        hwterrainLabel.text = homeworld.terrain
        hwpopulationLabel.text = homeworld.population
    }
}
