//
//  ShopContentView.swift
//  Item Shop Demo
//
//  Created by Michael Hinton on 10/29/21.
//  Copyright © 2021 HinTech, LLC. All rights reserved.
//

import SwiftUI

struct ShopContentView: View {
    @ObservedObject var viewModel = ShopContentViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                if let shopRotation = viewModel.shopRotation {
                    LazyVStack(spacing: .zero, pinnedViews: [.sectionHeaders]) {
                        CreatorCodeView()
                        
                        VStack(spacing: 4) {
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
                        .padding(EdgeInsets(top: 18, leading: 12, bottom: 10, trailing: 12))
                        
                        Section(header: ShopSectionHeaderView(title: "featured_items_section_header".localized)) {
                            ForEach(shopRotation.featuredItems) { item in
                                ShopItemView(item: item)
                            }
                        }
                        
                        Section(header: ShopSectionHeaderView(title: "daily_items_section_header".localized)) {
                            ForEach(shopRotation.dailyItems) { item in
                                ShopItemView(item: item)
                            }
                        }
                        
                        ShopFooterView()
                    }
                } else {
                    Text("Loading")
                }
            }
            .background(Color("PrimaryBackgroundColor"))
            .navigationTitle("SwiftUI/API")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ShopContentView_Previews: PreviewProvider {
    static var previews: some View {
        ShopContentView()
    }
}
