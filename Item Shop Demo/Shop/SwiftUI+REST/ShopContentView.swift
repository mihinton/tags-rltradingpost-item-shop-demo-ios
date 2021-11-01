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
            List {
                CreatorCodeView()
                TimeframeTitleView()
                ShopMessageView()
                ShopFooterView()
            }
            .listStyle(.plain)
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
