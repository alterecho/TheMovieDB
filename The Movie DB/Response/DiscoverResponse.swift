//
//  DiscoverResponse.swift
//  The Movie DB
//
//  Created by v.a.jayachandran on 23/5/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import Foundation

struct DiscoverResponse: Codable {
    let page: Int
    let total_results: Int
    let total_pages: Int
    let results: [Movie]
}
