//
//  StarshipsVC.swift
//  StarTrivia
//
//  Created by anna.sibirtseva on 09/05/2019.
//  Copyright © 2019 anna.sibirtseva. All rights reserved.
//

import UIKit

class StarshipsVC: UIViewController, PersonProtocol {
    
    @IBOutlet weak var stnameLabel: UILabel!
    @IBOutlet weak var stmodelLabel: UILabel!
    @IBOutlet weak var stmanufLabel: UILabel!
    @IBOutlet weak var stcostLabel: UILabel!
     @IBOutlet weak var stlengthLable: UILabel!
   
    @IBOutlet weak var stspeedLabel: UILabel!
    @IBOutlet weak var stcrewLabel: UILabel!
    @IBOutlet weak var stpassengLabel: UILabel!
   
    @IBOutlet weak var previousButton: FadeEnabledButton!
    @IBOutlet weak var nextButton: FadeEnabledButton!
    
        var person: Person!
        var starship: Starship!
        var starshipApi = StarshipApi()
        var starships = [String]()
        var currentStarship = 0
        
        override func viewDidLoad() {
            super.viewDidLoad()
            starships = person.starships
            previousButton.isEnabled = false
            nextButton.isEnabled = starships.count > 1 // true if more than 1 item in array
            guard let firstStarshipUrl = person.starships.first else { return }
            getStarship(url: firstStarshipUrl)
        }
        
        func getStarship(url: String) {
            starshipApi.getStarship(url: url) { (res) in
                switch res {
                case .success(let starship):
                    self.setupView(starship: starship)
                    self.starship = starship
                case .failure(let err):
                    print("Failed to fetch starship:", err)
                }
            }
        }
        
        
        func setupView(starship: Starship) {
            stnameLabel.text = starship.name
            stmodelLabel.text = starship.model
            stmanufLabel.text = starship.manufacturer
            stcostLabel.text = starship.cost_in_credits
            stlengthLable.text = starship.length
            stspeedLabel.text = starship.max_atmosphering_speed
            stcrewLabel.text = starship.crew
            stpassengLabel.text = starship.passengers
            
        }
    @IBAction func previousClicked(_ sender: Any) {
        currentStarship -= 1
        setButtonState()
    }
    
    
    @IBAction func nextClicked(_ sender: Any) {
        currentStarship += 1
        setButtonState()
    }
    
        func setButtonState() {
            
            nextButton.isEnabled = currentStarship == starships.count - 1 ? false : true
            previousButton.isEnabled = currentStarship == 0 ? false : true
            
            
            getStarship(url: starships[currentStarship])
        }
}


