//
//  HomeworldApi.swift
//  StarTrivia
//
//  Created by anna.sibirtseva on 10/05/2019.
//  Copyright © 2019 anna.sibirtseva. All rights reserved.
//

import Foundation


//Web request with  Codable Swift 5

class HomeworldApi{
    
}
func getHomeworld(url: String, completion: @escaping (Result<Homeworld, Error>) -> ()) {
    
    guard let url = URL(string: url) else { return }
    URLSession.shared.dataTask(with: url) { (data, resp, err) in
        if let err = err {
            completion(.failure(err))
            return
        }
        do {
            let homeworld = try JSONDecoder().decode(Homeworld.self, from: data!)
            DispatchQueue.main.async {
                completion(.success(homeworld))
            }
        } catch let jsonError {
            completion(.failure(jsonError))
        }
        }.resume()
    }



