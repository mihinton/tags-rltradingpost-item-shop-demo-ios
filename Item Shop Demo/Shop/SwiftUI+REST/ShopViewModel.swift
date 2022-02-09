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
    @Published var itemShop: ItemShop? = nil

    private let itemShopService = ItemShopService()
    private var disposables = Set<AnyCancellable>()

    init() {
        fetchItemShop()
    }

    func fetchItemShop() {
        itemShopService.getItemShop()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] value in
                switch value {
                case .failure:
                    self?.itemShop = nil
                case .finished:
                    break
                }
            } receiveValue: { [weak self] shop in
                self?.itemShop = shop
            }
            .store(in: &disposables)
    }
}
