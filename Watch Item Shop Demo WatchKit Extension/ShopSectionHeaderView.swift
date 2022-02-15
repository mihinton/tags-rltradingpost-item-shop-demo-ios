//
//  ShopSectionHeaderView.swift
//  Watch Item Shop Demo WatchKit Extension
//
//  Created by Michael Hinton on 2/15/22.
//  Copyright © 2022 HinTech, LLC. All rights reserved.
//

import SwiftUI

struct ShopSectionHeaderView: View {

    @ObservedObject var viewModel: ShopSectionHeaderViewModel

    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 2.0) {
                Text(viewModel.title)
                    .font(.headline)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                if let timeRemaining = viewModel.timeRemainingCountdownText {
                    HStack(spacing: 3.0) {
                        Image("countdown")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(Color("TimeRemainingColor"))
                        Text(timeRemaining)
                            .font(.caption2)
                            .foregroundColor(Color("TimeRemainingColor"))
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .frame(height: UIFont.preferredFont(forTextStyle: .caption2).pointSize)
                }
            }
            .padding([.vertical], 4.0)
            .padding([.horizontal], 8.0)
        }
        .background(Color("PrimaryBackgroundColor"))
    }
}

struct ShopSectionHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ShopSectionHeaderView(viewModel: createPopulatedSectionHeaderViewModel())
    }
    
    private static func createPopulatedSectionHeaderViewModel() -> ShopSectionHeaderViewModel {
        let viewModel = ShopSectionHeaderViewModel(
            title: "Featured Items",
            endDate: .nextShopRefresh
        )
        viewModel.timeRemainingCountdownText = "5 minutes 12 seconds"
        return viewModel
    }
}
