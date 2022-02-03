//
//  ResponseDecoder.swift
//  Item Shop Demo
//
//  Created by Michael Hinton on 2/3/22.
//  Copyright © 2022 HinTech, LLC. All rights reserved.
//

import Combine
import Foundation

func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, FetchError> {
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .millisecondsSince1970
    
    return Just(data)
        .decode(type: T.self, decoder: decoder)
        .mapError { error in
            .parsing(description: error.localizedDescription)
        }
        .eraseToAnyPublisher()
}
