//
//  ShopItemDetailsView.swift
//  Watch Item Shop Demo WatchKit Extension
//
//  Created by Michael Hinton on 2/15/22.
//  Copyright © 2022 HinTech, LLC. All rights reserved.
//

import AVKit
import SwiftUI

struct ShopItemDetailsView: View {

    let viewModel: ShopItemDetailsViewModel

    var body: some View {
        ScrollView {
            LazyVStack(spacing: .zero) {
                Text("In-Game Preview")
                    .font(.title2)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.top], 12.0)
            }
            .padding([.horizontal], 12.0)
        }
        .background(Color("PrimaryBackgroundColor"))
        .navigationTitle(viewModel.title)
        .navigationBarTitleDisplayMode(.inline)
    }

}

struct ShopItemDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ShopItemDetailsView(
            viewModel: ShopItemDetailsViewModel(
                item: RocketLeagueItem.fake()
            )
        )
    }
}
