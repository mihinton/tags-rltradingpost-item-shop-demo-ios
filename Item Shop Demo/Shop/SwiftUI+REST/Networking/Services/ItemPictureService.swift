//
//  ItemPictureService.swift
//  Item Shop Demo
//
//  Created by Michael Hinton on 2/8/22.
//  Copyright © 2022 HinTech, LLC. All rights reserved.
//

import Combine
import Foundation

protocol ItemPictureServiceProtocol: AnyObject {
    var networker: NetworkerProtocol { get }
    
    func getItemImageData(urlString: String) -> AnyPublisher<Data, Error>
}

final class ItemPictureService: ItemPictureServiceProtocol {

    let networker: NetworkerProtocol
    
    init(networker: NetworkerProtocol = Networker()) {
        self.networker = networker
    }
    
    enum ItemPictureError: Error {
        case dataInvalid
    }
    
    func getItemImageData(urlString: String) -> AnyPublisher<Data, Error> {
        guard let url = URL(string: urlString) else {
            return Fail<Data, Error>(error: NetworkError.invalidUrl).eraseToAnyPublisher()
        }
        
        return networker.getData(url: url, headers: [:])
            .mapError { _ in ItemPictureError.dataInvalid }
            .eraseToAnyPublisher()
    }
}
