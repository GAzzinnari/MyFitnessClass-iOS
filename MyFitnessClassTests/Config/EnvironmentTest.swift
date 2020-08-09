//
//  EnvironmentTest.swift
//  MyFitnessClassTests
//
//  Created by Gabriel on 8/4/20.
//  Copyright © 2020 Example. All rights reserved.
//

import Foundation
import XCTest
@testable import MyFitnessClass

class EnvironmentTest: XCTestCase {
    func test_allKeysHaveValue() {
        let values = [
            Environment.Keys.baseUrl: Environment.get(.baseUrl),
            Environment.Keys.environment: Environment.get(.environment),
            Environment.Keys.displayName: Environment.get(.displayName),
            Environment.Keys.servicesKey: Environment.get(.servicesKey)
        ]
        
        values.forEach() {
            XCTAssertNotEqual("", $1, $0.rawValue + " should have value")
        }
    }
}
