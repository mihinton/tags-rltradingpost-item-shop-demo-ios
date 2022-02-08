//
//  Endpoint+URL.swift
//  Item Shop Demo
//
//  Created by Michael Hinton on 2/8/22.
//  Copyright © 2022 HinTech, LLC. All rights reserved.
//

import Foundation

extension Endpoint {
    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "us-central1-rltp-item-shop-demo.cloudfunctions.net"
        components.path = "/\(path)"
        components.queryItems = queryItems
        
        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }
        
        return url
    }
    
    var headers: [String: Any] {
        return [
            "lang": Locale.current.languageCode ?? "en"
        ]
    }
}
