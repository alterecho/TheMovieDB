//
//  Movie.swift
//  The Movie DB
//
//  Created by v.a.jayachandran on 23/5/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import Foundation

struct Movie: Codable {
    let popularity: Double
    let video: Bool
    let poster_path: String
    let id: Int
    let backdrop_path: String
    let genre_ids: [Int]
    let title: String
    let overview: String
    let release_date: String
}
