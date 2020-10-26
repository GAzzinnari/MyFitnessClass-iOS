//
//  User.swift
//  sense-ios
//
//  Created by Mobile on 10/23/20.
//  Copyright © 2020 Aledev. All rights reserved.
//

import Foundation

struct Login: Codable {
    
    let email: String
    let password: String
    
}

extension Login {
    
    enum CodingKeys: String, CodingKey {
        case email = "perEmail"
        case password = "perPassword"
    }
    
}
