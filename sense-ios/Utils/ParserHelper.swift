//
//  ParseHelpers.swift
//  sense-ios
//
//  Created by Mobile on 10/25/20.
//  Copyright © 2020 Aledev. All rights reserved.
//

import Foundation
import Combine

class ParserHelper {
    
    class func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, ServiceError> {
      let decoder = JSONDecoder()
      decoder.dateDecodingStrategy = .secondsSince1970

      return Just(data)
        .decode(type: T.self, decoder: decoder)
        .mapError { error in
          .parsing(description: error.localizedDescription)
        }
        .eraseToAnyPublisher()
    }

}
