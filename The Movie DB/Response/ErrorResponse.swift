//
//  ErrorResponse.swift
//  The Movie DB
//
//  Created by v.a.jayachandran on 24/5/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import Foundation

class ErrorResponse: Codable, Error {
    let status_message: String?
    let status_code: Int?
    
    var localizedDescription: String {
        return status_message ?? ""
    }
}
