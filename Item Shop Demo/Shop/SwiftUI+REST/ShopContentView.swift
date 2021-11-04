//
//  ShopContentView.swift
//  Item Shop Demo
//
//  Created by Michael Hinton on 10/29/21.
//  Copyright © 2021 HinTech, LLC. All rights reserved.
//

import SwiftUI

struct ShopContentView: View {
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
                        Text("Hi! This is a test to see how links would work here, so let's see how it goes: https://rltradingpost.app")
                            .font(.callout)
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(EdgeInsets(top: 18, leading: 12, bottom: 10, trailing: 12))
                    
                    Section(header: ShopSectionHeaderView(title: "featured_items_section_header".localized)) {
                        
                    }
                    
                    Section(header: ShopSectionHeaderView(title: "daily_items_section_header".localized)) {
                        
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
