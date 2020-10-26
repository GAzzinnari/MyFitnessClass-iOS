//
//  ScheduleRequest.swift
//  sense-ios
//
//  Created by Mobile on 10/25/20.
//  Copyright © 2020 Aledev. All rights reserved.
//

import Foundation

struct ScheduleRequest: Codable {
    
    let boxId: Int
    let dayNumber: Int
    let hour: Int
    let userId: Int
    let assists: Bool
    let classType: String
    
}

extension ScheduleRequest {
    
    enum CodingKeys: String, CodingKey {
        case boxId = "empCod"
        case dayNumber = "dia"
        case hour = "hora"
        case userId = "perCedula"
        case assists = "resAsistio"
        case classType = "clasTipo"
    }
    
}
