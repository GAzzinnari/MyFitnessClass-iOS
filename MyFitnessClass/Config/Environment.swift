//
//  Environment.swift
//  MyFitnessClass
//
//  Created by Gabriel on 8/4/20.
//  Copyright © 2020 Example. All rights reserved.
//

import Foundation

public enum Environment {
    private static let dictionary: [String: Any] = {
        guard let infoPlist = Bundle.main.infoDictionary else {
            fatalError("Info.plist could not be found")
        }
        return infoPlist
    }()
    
    enum Keys: String {
        case environment = "ENVIRONMENT"
        case baseUrl = "BASE_URL"
        case displayName = "DISPLAY_NAME"
        case servicesKey = "SERVICES_KEY"
    }
    
    static func get(_ key: Keys) -> String {
        return dictionary[key.rawValue] as? String ?? ""
    }
}
