//
//  VideosResponse.swift
//  The Movie DB
//
//  Created by v.a.jayachandran on 24/5/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import Foundation

struct VideosResponse: Codable {
    let id: Int
    let results: [Video]
}
