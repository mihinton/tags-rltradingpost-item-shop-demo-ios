//
//  ShopView.swift
//  Watch Item Shop Demo WatchKit Extension
//
//  Created by Michael Hinton on 2/15/22.
//  Copyright © 2022 HinTech, LLC. All rights reserved.
//

import SwiftUI

struct ShopView: View {

    @ObservedObject var viewModel: ShopViewModel

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: .zero) {
                    if let itemShop = viewModel.itemShop {
                        ShopContentView(itemShop: itemShop)
                        CreatorCodeView()
                        ShopFooterView()
                    } else {
                        CreatorCodeView()
                        Text("Loading ...")
                            .padding([.top], 20.0)
                    }
                }
            }
            .background(Color("PrimaryBackgroundColor"))
            .navigationTitle("todays_shop_title".localized)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

private extension ShopView {

    struct CreatorCodeView: View {
        var body: some View {
            ZStack {
                VStack(spacing: 3.0) {
                    Text("Support RL Trading Post with Creator Code 🔥RLTP🔥")
                        .font(.caption2)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding([.all], 8.0)
            }
            .background(Color(hex: "#1DABEB"))
            .cornerRadius(10)
            .padding([.top], 8.0)
        }
    }
    
    struct ShopContentView: View {
        let itemShop: ItemShop

        var body: some View {
            if let message = itemShop.message {
                Text(message)
                    .font(.caption2)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.vertical], 8.0)
            }
            
            Section(
                header: ShopSectionHeaderView(
                    viewModel: ShopSectionHeaderViewModel(
                        title: "featured_items_section_header".localized,
                        endDate: itemShop.featuredEndDate
                    )
                )
            ) {
                ForEach(itemShop.featuredItems) { item in
                    NavigationLink(destination: ShopItemDetailsView(
                        viewModel: ShopItemDetailsViewModel(item: item)
                    )) {
                        ShopItemView(
                            viewModel: ShopItemViewModel(item: item, isFeatured: true)
                        )
                    }
                    .buttonStyle(.plain)
                }
            }
            
            Section(
                header: ShopSectionHeaderView(
                    viewModel: ShopSectionHeaderViewModel(
                        title: "daily_items_section_header".localized,
                        endDate: itemShop.dailyEndDate
                    )
                )
            ) {
                ForEach(itemShop.dailyItems) { item in
                    NavigationLink(destination: ShopItemDetailsView(
                        viewModel: ShopItemDetailsViewModel(item: item)
                    )) {
                        ShopItemView(
                            viewModel: ShopItemViewModel(item: item)
                        )
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }
    
    struct ShopFooterView: View {
        var body: some View {
            Text("item_shop_footer".localized)
                .font(.footnote)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.vertical], 8.0)
        }
    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ShopView(viewModel: createPopulatedShopViewModel())
            ShopView(viewModel: ShopViewModel())
        }
    }
    
    private static func createPopulatedShopViewModel() -> ShopViewModel {
        let viewModel = ShopViewModel()
        viewModel.itemShop = ItemShop.fake()
        return viewModel
    }
}
