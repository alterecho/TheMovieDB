//
//  UserReviewsResponse.swift
//  The Movie DB
//
//  Created by v.a.jayachandran on 24/5/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import Foundation

struct UserReviewsResponse: Codable {
    let id: Int
    let page: Int
    let results: [UserReview]
    let total_pages: Int
    let total_results: Int
}
