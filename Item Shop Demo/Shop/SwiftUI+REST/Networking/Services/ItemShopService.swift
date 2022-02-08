//
//  ItemShopService.swift
//  Item Shop Demo
//
//  Created by Michael Hinton on 2/8/22.
//  Copyright © 2022 HinTech, LLC. All rights reserved.
//

import Combine
import Foundation

protocol ItemShopServiceProtocol: AnyObject {
    var networker: NetworkerProtocol { get }
    
    func getItemShop() -> AnyPublisher<ShopRotation, Error>
}

final class ItemShopService: ItemShopServiceProtocol {

    let networker: NetworkerProtocol

    init(networker: NetworkerProtocol = Networker()) {
        self.networker = networker
    }
    
    func getItemShop() -> AnyPublisher<ShopRotation, Error> {
        let endpoint = Endpoint.itemShop
        
        return networker.get(type: ShopRotation.self,
                             url: endpoint.url,
                             headers: endpoint.headers)
    }
}
