//
//  ShopMessageView.swift
//  Item Shop Demo
//
//  Created by Michael Hinton on 11/1/21.
//  Copyright © 2021 HinTech, LLC. All rights reserved.
//

import SwiftUI

struct ShopMessageView: View {
    var body: some View {
        Text("Hi! This is a test to see how links would work see, so let's see how it goes: https://rltradingpost.app")
            .font(.callout)
            .foregroundColor(.primary)
            .multilineTextAlignment(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            .listRowInsets(EdgeInsets(top: 4, leading: 12, bottom: 0, trailing: 12))
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
            .buttonStyle(.borderless)
    }
}

struct ShopMessageView_Previews: PreviewProvider {
    static var previews: some View {
        ShopMessageView()
    }
}
