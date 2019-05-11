//
//  VehicleApi.swift
//  StarTrivia
//
//  Created by anna.sibirtseva on 10/05/2019.
//  Copyright © 2019 anna.sibirtseva. All rights reserved.
//

import Foundation

class StarshipApi{
    
    func getStarship(url: String, completion: @escaping (Result<Starship, Error>) -> ()) {
        
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                completion(.failure(err))
                return
            }
            do {
                let starship = try JSONDecoder().decode(Starship.self, from: data!)
                DispatchQueue.main.async {
                    completion(.success(starship))
                }
            } catch let jsonError {
                completion(.failure(jsonError))
            }
            }.resume()
    }
}
