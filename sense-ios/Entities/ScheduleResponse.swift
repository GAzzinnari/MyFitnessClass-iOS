//
//  ScheduleResponse.swift
//  sense-ios
//
//  Created by Mobile on 10/25/20.
//  Copyright © 2020 Aledev. All rights reserved.
//

import Foundation

class ScheduleResponse {
    
    let schedule: ScheduleRequest
    let created: Bool
    
    init(schedule: ScheduleRequest, created: Bool) {
        self.schedule = schedule
        self.created = created
    }
    
}
