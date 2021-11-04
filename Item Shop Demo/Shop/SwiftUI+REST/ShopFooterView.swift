//
//  ShopFooterView.swift
//  Item Shop Demo
//
//  Created by Michael Hinton on 11/1/21.
//  Copyright © 2021 HinTech, LLC. All rights reserved.
//

import SwiftUI

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

struct ShopFooterView_Previews: PreviewProvider {
    static var previews: some View {
        ShopFooterView()
    }
}
