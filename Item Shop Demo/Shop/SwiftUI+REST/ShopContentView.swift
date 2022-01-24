//
//  ShopContentView.swift
//  Item Shop Demo
//
//  Created by Michael Hinton on 10/29/21.
//  Copyright © 2021 HinTech, LLC. All rights reserved.
//

import SwiftUI

struct ShopContentView: View {
    let shopItem = ShopItem(name: "Vampire Bat", category: "Goal Explosion", color: "Cobalt", certification: "None", rarity: "Import", price: 700, isTradable: true, imageUrl: "https://s3.us-east-2.amazonaws.com/i.rltradingpost.net/DemoImages/VampireBat.png")

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: .zero, pinnedViews: [.sectionHeaders]) {
                    CreatorCodeView()
                    
                    VStack(spacing: 4) {
                        Text("todays_shop_title".localized)
                            .font(.title)
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("Hello!")
                            .font(.callout)
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(EdgeInsets(top: 18, leading: 12, bottom: 10, trailing: 12))
                    
                    Section(header: ShopSectionHeaderView(title: "featured_items_section_header".localized)) {
                        ShopItemView(item: shopItem)
                        ShopItemView(item: shopItem)
                    }
                    
                    Section(header: ShopSectionHeaderView(title: "daily_items_section_header".localized)) {
                        ShopItemView(item: shopItem)
                        ShopItemView(item: shopItem)
                        ShopItemView(item: shopItem)
                        ShopItemView(item: shopItem)
                        ShopItemView(item: shopItem)
                        ShopItemView(item: shopItem)
                    }
                    
                    ShopFooterView()
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
