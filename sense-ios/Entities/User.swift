//
//  User.swift
//  sense-ios
//
//  Created by Mobile on 10/23/20.
//  Copyright © 2020 Aledev. All rights reserved.
//

import Foundation

struct User: Codable, Equatable {
    
    let id: Int
    let email: String
    let name: String
    let lastName: String
    let dateOfBirth: String
    let address: String
    let telNumber: Int
    let genre: String
    let userType: String
    let registrationDate: String
    let boxId: Int

}

extension User {
    
    enum CodingKeys: String, CodingKey {
        case id = "percedula"
        case email = "perEmail"
        case name = "pernombre"
        case lastName = "perApellido"
        case dateOfBirth = "perfechaN"
        case address = "perDireccion"
        case telNumber = "pertelefono"
        case genre = "perSexo"
        case userType = "perTipo"
        case registrationDate = "perregistro"
        case boxId = "empCod"
    }
    
}
