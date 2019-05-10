//
//  VehicleApi.swift
//  StarTrivia
//
//  Created by anna.sibirtseva on 10/05/2019.
//  Copyright © 2019 anna.sibirtseva. All rights reserved.
//

import Foundation

class VehicleApi{

func getVehicle(url: String, completion: @escaping (Result<Vehicle, Error>) -> ()) {
    
    guard let url = URL(string: url) else { return }
    URLSession.shared.dataTask(with: url) { (data, resp, err) in
        if let err = err {
            completion(.failure(err))
            return
        }
        do {
            let vehicle = try JSONDecoder().decode(Vehicle.self, from: data!)
            DispatchQueue.main.async {
                completion(.success(vehicle))
            }
        } catch let jsonError {
            completion(.failure(jsonError))
        }
        }.resume()
    }
}
