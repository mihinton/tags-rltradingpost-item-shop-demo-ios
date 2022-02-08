//
//  ShopItemViewModel.swift
//  Item Shop Demo
//
//  Created by Michael Hinton on 2/4/22.
//  Copyright © 2022 HinTech, LLC. All rights reserved.
//

import Combine
import Foundation
import UIKit

class ShopItemViewModel: ObservableObject {

    let item: ShopItem
    let isFeatured: Bool

    @Published var imageData: Data? = nil

    private let itemShopFetcher = ItemShopFetcher()
    private var disposables = Set<AnyCancellable>()

    var categoryImageFileName: String {
        return item.category.lowercased().replacingOccurrences(of: " ", with: "-")
    }

    init(item: ShopItem, isFeatured: Bool = false) {
        self.item = item
        self.isFeatured = isFeatured
        
        getImageData()
    }
    
    private func getImageData() {
        itemShopFetcher.itemData(urlString: item.imageUrl!)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error): print(error)
                case .finished: break
                }
            } receiveValue: { [weak self] data in
                self?.imageData = data
            }
            .store(in: &disposables)
    }
}
