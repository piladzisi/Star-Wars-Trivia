//
//  FilmApi.swift
//  StarTrivia
//
//  Created by anna.sibirtseva on 11/05/2019.
//  Copyright © 2019 anna.sibirtseva. All rights reserved.
//

import Foundation

class FilmApi{
    
    func getFilm(url: String, completion: @escaping (Result<Film, Error>) -> ()) {
        
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                completion(.failure(err))
                return
            }
            do {
                let film = try JSONDecoder().decode(Film.self, from: data!)
                DispatchQueue.main.async {
                    completion(.success(film))
                }
            } catch let jsonError {
                completion(.failure(jsonError))
            }
            }.resume()
    }
}
