//
//  Film.swift
//  StarTrivia
//
//  Created by anna.sibirtseva on 11/05/2019.
//  Copyright © 2019 anna.sibirtseva. All rights reserved.
//

import Foundation


struct Film: Decodable  {
    let title: String
    let episode_id: Int
    let release_date: String
    let producer: String
    let director: String
    let opening_crawl: String
}
