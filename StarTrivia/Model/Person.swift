//
//  Person.swift
//  StarTrivia
//
//  Created by anna.sibirtseva on 08/05/2019.
//  Copyright © 2019 anna.sibirtseva. All rights reserved.
//

import Foundation


struct Person: Decodable {
    let name: String
    let height: String
    let mass: String
    let hair_color: String
    let birth_year: String
    let gender: String
    let homeworld: String
    let films: [String]
    let vehicles: [String]
    let starships: [String]
    
//    
//    enum CodingKeys: String, CodingKey {
//        case name
//        case height
//        case mass
//        case hair = "hair_color"
//        case birthYear = "birth_year"
//        case gender
//        case homeworld
//        case films
//        case vehicles
//        case starships
//    }
}
