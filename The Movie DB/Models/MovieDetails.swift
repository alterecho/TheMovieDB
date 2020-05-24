//
//  MovieDetails.swift
//  The Movie DB
//
//  Created by v.a.jayachandran on 23/5/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import Foundation

struct MovieDetails: Codable {
    let overview: String
    let poster_path: String
    let release_date: String
    let title: String
    let video: Bool
}
