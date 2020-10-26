//
//  ServiceError.swift
//  sense-ios
//
//  Created by Mobile on 10/25/20.
//  Copyright © 2020 Aledev. All rights reserved.
//

import Foundation

enum ServiceError: Error {
    case parsing(description: String)
    case serializing(description: String)
    case network(description: String)
}
