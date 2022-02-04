//
//  ShopView.swift
//  Item Shop Demo
//
//  Created by Michael Hinton on 10/29/21.
//  Copyright © 2021 HinTech, LLC. All rights reserved.
//

import SwiftUI

struct ShopView: View {

    @ObservedObject var viewModel: ShopViewModel

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: .zero, pinnedViews: [.sectionHeaders]) {
                    CreatorCodeView()
                    
                    if let shopRotation = viewModel.shopRotation {
                        ShopContentView(shopRotation: shopRotation)
                        ShopFooterView()
                    } else {
                        Text("Loading ...")
                            .padding([.top], 20)
                    }
                }
            }
            .background(Color("PrimaryBackgroundColor"))
            .navigationTitle("SwiftUI/API")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

private extension ShopView {

    struct CreatorCodeView: View {
        @Environment(\.openURL) var openUrl

        var body: some View {
            Button(action: openSupportAction) {
                HStack(spacing: 10.0) {
                    Image("rl-trading-post-logo")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .padding([.leading], 10)
                    VStack(spacing: 3.0) {
                        Text("support_rl_trading_post_title".localized)
                            .font(.headline)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("support_rl_trading_post_body".localized)
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding([.top, .bottom, .trailing], 10)
                }
                .background(Color(hex: "#1DABEB"))
                .cornerRadius(10)
            }
            .padding(EdgeInsets(top: 12, leading: 12, bottom: 0, trailing: 12))
        }
        
        private func openSupportAction() {
            if let url = URL(string: "https://rltradingpost.app/support_a_creator") {
                openUrl(url)
            }
        }
    }
    
    struct ShopContentView: View {
        let shopRotation: ShopRotation

        var body: some View {
            VStack(spacing: 4.0) {
                Text("todays_shop_title".localized)
                    .font(.title)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                if let message = shopRotation.message {
                    Text(message)
                        .font(.callout)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .padding(EdgeInsets(top: 18, leading: 12, bottom: 12, trailing: 12))
            
            Section(
                header: ShopSectionHeaderView(
                    viewModel: ShopSectionHeaderViewModel(
                        title: "featured_items_section_header".localized,
                        endDate: shopRotation.featuredEndDate
                    )
                )
            ) {
                ForEach(shopRotation.featuredItems) { item in
                    ShopItemView(item: item)
                }
            }
            
            Section(
                header: ShopSectionHeaderView(
                    viewModel: ShopSectionHeaderViewModel(
                        title: "daily_items_section_header".localized,
                        endDate: shopRotation.dailyEndDate
                    )
                )
            ) {
                ForEach(shopRotation.dailyItems) { item in
                    ShopItemView(item: item)
                }
            }
        }
    }
    
    struct ShopFooterView: View {
        var body: some View {
            Text("item_shop_footer".localized)
                .font(.caption2)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(EdgeInsets(top: 6, leading: 12, bottom: 12, trailing: 12))
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
    
    static func createPopulatedShopViewModel() -> ShopViewModel {
        let viewModel = ShopViewModel()
        viewModel.shopRotation = ShopRotation.fake()
        return viewModel
    }
}
