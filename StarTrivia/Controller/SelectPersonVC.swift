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
    @IBOutlet weak var homeworldButton: UIButton!
    @IBOutlet weak var vehiclesButton: UIButton!
    @IBOutlet weak var starshipsButton: UIButton!
    @IBOutlet weak var filmsButton: UIButton!
    
    var personApi = PersonApi()
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func randomClicked(_ sender: Any) {
        let random = Int.random(in: 1...87)
        personApi.getRandomPersonCodableSwift5(id: random) { (res) in
            switch res {
            case .success(let person):
                self.setupView(person: person)
                self.person = person
            case .failure(let err):
                print("Failed to fetch person:", err)
            }
        }
    }
    
    func setupView(person: Person) {
        nameLabel.text = person.name
        heightLabel.text = person.height
        massLabel.text = person.mass
        hairLabel.text = person.hair_color
        birthYearLabel.text = person.birth_year
        genderLabel.text = person.gender
        
        homeworldButton.isEnabled = !person.homeworld.isEmpty
        vehiclesButton.isEnabled = !person.vehicles.isEmpty
        starshipsButton.isEnabled = !person.starships.isEmpty
        filmsButton.isEnabled = !person.films.isEmpty
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier {
        case Segue.homeworld.rawValue:
            if let destination = segue.destination as? HomeworldVC {
                destination.person = person
            }
        case Segue.vehicles.rawValue:
            if let destination = segue.destination as? VehiclesVC {
                destination.person = person
            }
        case Segue.starships.rawValue:
            if let destination = segue.destination as? StarshipsVC {
                destination.person = person
            }
        case Segue.films.rawValue:
            if let destination = segue.destination as? FilmsVC {
                destination.person = person
            }
        default:
            break
        }
    }
    
    enum Segue: String {
        case homeworld = "toHomeworld"
        case vehicles = "toVehicles"
        case starships = "toStarships"
        case films = "toFilms"
    }
}
