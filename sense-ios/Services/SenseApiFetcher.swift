//
//  SenseApiFetcher.swift
//  sense-ios
//
//  Created by Mobile on 10/25/20.
//  Copyright © 2020 Aledev. All rights reserved.
//

import Foundation
import Combine

protocol SenseApiFetchable {
    
    func login(credentials: Login) -> AnyPublisher<Token, ServiceError>
//    func userInfo(token: Token) -> AnyPublisher<User, ServiceError>
//    func classes(token: Token) -> AnyPublisher<ScheduledClass, ServiceError>
//    func schedule(scheduleList: [ScheduleRequest]) -> AnyPublisher<ScheduleResponse, ServiceError>
//
}

class SenseApiFetcher {
    
    private let serviceHelper: RestServiceHelper
    
    init(serviceHelper: RestServiceHelper) {
        self.serviceHelper = serviceHelper
    }
    
}

extension SenseApiFetcher: SenseApiFetchable {

    func login(credentials: Login) -> AnyPublisher<Token, ServiceError> {
        return self.serviceHelper.postRequest(with: Endpoints.loginEndpoint.rawValue, body: credentials, of: Token.self)
    }
//    
//    func userInfo(token: Token) -> AnyPublisher<User, ServiceError> {
//        <#code#>
//    }
//    
//    func classes(token: Token) -> AnyPublisher<ScheduledClass, ServiceError> {
//        <#code#>
//    }
//    
//    func schedule(scheduleList: [ScheduleRequest]) -> AnyPublisher<ScheduleResponse, ServiceError> {
//        <#code#>
//    }
    
}
