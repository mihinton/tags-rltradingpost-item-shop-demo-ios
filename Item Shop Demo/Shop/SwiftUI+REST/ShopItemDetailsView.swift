//
//  ShopItemDetailsView.swift
//  Item Shop Demo
//
//  Created by Michael Hinton on 2/13/22.
//  Copyright © 2022 HinTech, LLC. All rights reserved.
//

import AVKit
import SwiftUI

struct ShopItemDetailsView: View {

    let viewModel: ShopItemDetailsViewModel

    var body: some View {
        let player = AVPlayer(url: URL(string: viewModel.item.previewUrl!)!)
        ScrollView {
            LazyVStack(spacing: .zero, pinnedViews: [.sectionHeaders]) {
                GeometryReader { metrics in
                    VideoPlayer(player: player)
                        .cornerRadius(10)
                        .frame(height: metrics.size.width * 9.0 / 16.0)
                }
                .padding([.top], 12.0)
                .padding([.horizontal], 12.0)
            }
        }
        .background(Color("PrimaryBackgroundColor"))
        .navigationTitle(viewModel.title)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            player.play()
        }
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
