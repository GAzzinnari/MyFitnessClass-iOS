//
//  ScheduleClass.swift
//  sense-ios
//
//  Created by Mobile on 10/25/20.
//  Copyright © 2020 Aledev. All rights reserved.
//

import Foundation

struct ScheduledClass: Codable {
    
    let boxName: String
    let boxId: Int
    let date: String
    let userId: Int
    let assists: Bool
    let classType: String
    let classDescription: String
    
}

extension ScheduledClass {
    
    enum CodingKeys: String, CodingKey {
        case boxName = "empNom"
        case boxId = "empCod"
        case date = "clasFyH"
        case userId = "perCelula"
        case assists = "resAsistio"
        case classType = "clasTipo"
        case classDescription = "clasDescript"
    }
    
}
