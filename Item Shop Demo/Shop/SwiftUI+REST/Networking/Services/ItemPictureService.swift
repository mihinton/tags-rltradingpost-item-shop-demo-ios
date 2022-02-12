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
        
        // Attempt to retrieve image from disk
        // (this could also be done using NSCache, but I'd prefer saving S3 bandwidth on future image requests)
        let imageName = url.lastPathComponent
        let cacheLocation = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(imageName)
        if FileManager().fileExists(atPath: cacheLocation.path) {
            do {
                let data = try Data(contentsOf: cacheLocation)
                return CurrentValueSubject(data).eraseToAnyPublisher()
            } catch {
                print("thought file from \(url) was available locally, but reading failed: ", error)
            }
        }
        
        return networker.getData(url: url, headers: [:])
            .mapError { _ in ItemPictureError.dataInvalid }
            .handleEvents(receiveOutput: { data in
                do {
                    try data.write(to: cacheLocation)
                } catch {
                    print("error saving file from \(url): ", error)
                }
            })
            .eraseToAnyPublisher()
    }
}
