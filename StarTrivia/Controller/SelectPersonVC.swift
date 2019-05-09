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
    
    override func viewDidLoad() {
        super.viewDidLoad()
      }
    
        //Web request with  Codable Swift 5
        
        fileprivate func getRandomPersonCodableSwift5(id: Int, completion: @escaping (Result<Person, Error>) -> ()) {
            
            guard let url = URL(string: "\(PERSON_URL)\(id)") else { return }
            URLSession.shared.dataTask(with: url) { (data, resp, err) in
                
                if let err = err {
                    completion(.failure(err))
                    return
                }
                do {
                    let person = try JSONDecoder().decode(Person.self, from: data!)
                    DispatchQueue.main.async {
                        completion(.success(person))
                    }
                  } catch let jsonError {
                    completion(.failure(jsonError))
                }
            }.resume()
        }
        


    @IBAction func randomClicked(_ sender: Any) {
        let random = Int.random(in: 1...87)
        getRandomPersonCodableSwift5(id: random) { (res) in
            switch res {
            case .success(let person):
                self.setupView(person: person)
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
    @IBAction func homeworldClicked(_ sender: Any) {
    }
    
    @IBAction func vehiclesClicked(_ sender: Any) {
    }
    
    @IBAction func starshipsClicked(_ sender: Any) {
    }
    @IBAction func filmsClicked(_ sender: Any) {
    }
    
}


