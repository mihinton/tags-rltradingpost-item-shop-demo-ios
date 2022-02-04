//
//  ShopViewModel.swift
//  Item Shop Demo
//
//  Created by Michael Hinton on 2/3/22.
//  Copyright © 2022 HinTech, LLC. All rights reserved.
//

import Combine
import SwiftUI

class ShopViewModel: ObservableObject {
    @Published var shopRotation: ShopRotation? = nil

    private let itemShopFetcher = ItemShopFetcher()
    private var disposables = Set<AnyCancellable>()

    init() {
        fetchItemShop()
    }

    func fetchItemShop() {
        itemShopFetcher.shopRotation()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] value in
                switch value {
                case .failure:
                    self?.shopRotation = nil
                case .finished:
                    break
                }
            } receiveValue: { [weak self] shop in
                self?.shopRotation = shop
            }
            .store(in: &disposables)
    }
}
