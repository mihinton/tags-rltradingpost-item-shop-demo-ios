//
//  ItemShopFetcher.swift
//  Item Shop Demo
//
//  Created by Michael Hinton on 2/3/22.
//  Copyright © 2022 HinTech, LLC. All rights reserved.
//

import Combine
import Foundation

protocol ItemShopFetchable {
    func shopRotation() -> AnyPublisher<ShopRotation, FetchError>
    func itemData(urlString: String) -> AnyPublisher<Data, URLError>
}

class ItemShopFetcher: ItemShopFetchable {

    private let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }

    func shopRotation() -> AnyPublisher<ShopRotation, FetchError> {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "us-central1-rltp-item-shop-demo.cloudfunctions.net"
        components.path = "/itemShop-get"
        
        guard let url = components.url else {
            return Fail(error: .network(description: "Couldn't create URL")).eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let lang = Locale.current.languageCode ?? "en"
        request.setValue(lang, forHTTPHeaderField: "lang")
        
        return session.dataTaskPublisher(for: request)
            .mapError { error in
                .network(description: error.localizedDescription)
            }
            .flatMap(maxPublishers: .max(1)) { pair in
                decode(pair.data)
            }
            .eraseToAnyPublisher()
    }
    
    func itemData(urlString: String) -> AnyPublisher<Data, URLError> {
        let url = URL(string: urlString)!
        
        return session.dataTaskPublisher(for: url)
            .map(\.data)
            .eraseToAnyPublisher()
    }

}
