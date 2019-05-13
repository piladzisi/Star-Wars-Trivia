//
//  FilmsVC.swift
//  StarTrivia
//
//  Created by anna.sibirtseva on 09/05/2019.
//  Copyright © 2019 anna.sibirtseva. All rights reserved.
//

import UIKit

class FilmsVC: UIViewController, PersonProtocol {
    
    @IBOutlet weak var fltitleLabel: UILabel!
    @IBOutlet weak var flepisodeLabel: UILabel!
    @IBOutlet weak var fldirectorLabel: UILabel!
    @IBOutlet weak var flproducerLabel: UILabel!
    @IBOutlet weak var flreleasedLabel: UILabel!
    @IBOutlet weak var crawlLabel: UITextView!
    
    @IBOutlet weak var bgimage: UIImageView!
    @IBOutlet weak var previousButton: FadeEnabledButton!
    
    @IBOutlet weak var nextButton: FadeEnabledButton!
    
    var person: Person!
    var film: Film!
    var filmApi = FilmApi()
    var films = [String]()
    var currentFilm = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        films = person.films
        previousButton.isEnabled = false
        nextButton.isEnabled = films.count > 1 // true if more than 1 item in array
        guard let firstFilmUrl = person.films.first else { return }
        getFilm(url: firstFilmUrl)
        self.view.sendSubviewToBack(bgimage)
    }
    
    func getFilm(url: String) {
        filmApi.getFilm(url: url) { (res) in
            switch res {
            case .success(let film):
                self.setupView(film: film)
                self.film = film
            case .failure(let err):
                print("Failed to fetch film:", err)
            }
        }
    }
    
    
    func setupView(film: Film) {
        fltitleLabel.text = film.title
        flepisodeLabel.text = String(film.episode_id)
        fldirectorLabel.text = film.director
        flproducerLabel.text = film.producer
        flreleasedLabel.text = film.release_date
        let stripped = film.opening_crawl.replacingOccurrences(of: "\n", with: " ")
        crawlLabel.text = stripped.replacingOccurrences(of: "\r", with: "")
        
    }
  
    @IBAction func previousClicked(_ sender: Any) {
        currentFilm -= 1
        setButtonState()
    }
    
    @IBAction func nextClicked(_ sender: Any) {
        currentFilm += 1
        setButtonState()
    }
  
    
    func setButtonState() {
        
        nextButton.isEnabled = currentFilm == films.count - 1 ? false : true
        previousButton.isEnabled = currentFilm == 0 ? false : true
        
        
        getFilm(url: films[currentFilm])
    }
}


