//
//  ConfigResponse.swift
//  The Movie DB
//
//  Created by v.a.jayachandran on 24/5/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import Foundation

struct ConfigResponse: Codable {
    
    let images: Images
    
    struct Images: Codable {
        let base_url: String
        let secure_base_url: String
    }
}
