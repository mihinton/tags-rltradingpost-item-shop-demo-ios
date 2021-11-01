//
//  TimeframeTitleView.swift
//  Item Shop Demo
//
//  Created by Michael Hinton on 11/1/21.
//  Copyright © 2021 HinTech, LLC. All rights reserved.
//

import SwiftUI

struct TimeframeTitleView: View {
    var body: some View {
        Text("todays_shop_title".localized)
            .font(.title)
            .foregroundColor(.primary)
            .multilineTextAlignment(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            .listRowInsets(EdgeInsets(top: 18, leading: 12, bottom: 0, trailing: 12))
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
            .buttonStyle(.borderless)
    }
}

struct TimeframeTitleView_Previews: PreviewProvider {
    static var previews: some View {
        TimeframeTitleView()
    }
}
