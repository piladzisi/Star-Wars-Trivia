//
//  Vehicle.swift
//  StarTrivia
//
//  Created by anna.sibirtseva on 10/05/2019.
//  Copyright © 2019 anna.sibirtseva. All rights reserved.
//

import Foundation

struct Vehicle: Decodable  {
    let name: String
    let model: String
    let manufacturer: String
    let cost_in_credits: String
    let length: String
    let max_atmosphering_speed: String
    let crew: String
    let passengers: String
}
