//
//  ServiceHelper.swift
//  sense-ios
//
//  Created by Mobile on 10/25/20.
//  Copyright © 2020 Aledev. All rights reserved.
//

import Foundation
import Combine

protocol RestServiceHelper {
    
    func getRequest<T>(with components: URLComponents) -> AnyPublisher<T, ServiceError> where T: Decodable
    func postRequest<T, K>(with url: String, body: K, of type: T.Type) -> AnyPublisher<T, ServiceError> where T: Decodable, K: Encodable
    
}

class ServiceHelper  {
 
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
}

extension ServiceHelper: RestServiceHelper {
    
    func getRequest<T>(with components: URLComponents) -> AnyPublisher<T, ServiceError> where T : Decodable {
        guard let url = components.url else {
            let error = ServiceError.network(description: "Couldn't create URL")
            return Fail(error: error).eraseToAnyPublisher()
        }
        
        return session.dataTaskPublisher(for: URLRequest(url: url))
            .mapError { error in
                ServiceError.network(description: error.localizedDescription)
            }
            .flatMap(maxPublishers: .max(1)){ pair in
                ParserHelper.decode(pair.data)
            }
            .eraseToAnyPublisher()
    }
    
    func postRequest<T, K>(with url: String, body: K, of type: T.Type) -> AnyPublisher<T, ServiceError> where T: Decodable, K: Encodable {
        guard let endpoint = URL.init(string: url) else {
            let error = ServiceError.network(description: "Couldn't create URL")
            return Fail(error: error).eraseToAnyPublisher()
        }
        guard let jsonData = try? JSONEncoder().encode(body) else {
            let error = ServiceError.serializing(description: "Couldn't serialize the body object as JSON")
            return Fail(error: error).eraseToAnyPublisher()
        }                
        
        var request = URLRequest(url: endpoint)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("*/*", forHTTPHeaderField: "Accept")
        request.httpMethod = "POST"
        request.httpBody = jsonData
        
        return session.dataTaskPublisher(for: request)
            .mapError { error in
                ServiceError.network(description: error.localizedDescription)
            }
            .flatMap(maxPublishers: .max(1)){ pair in
                ParserHelper.decode(pair.data)
            }
            .eraseToAnyPublisher()
    }
    
}


