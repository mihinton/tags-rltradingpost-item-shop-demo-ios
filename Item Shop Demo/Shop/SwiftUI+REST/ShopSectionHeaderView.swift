//
//  ShopSectionHeaderView.swift
//  Item Shop Demo
//
//  Created by Michael Hinton on 11/3/21.
//  Copyright © 2021 HinTech, LLC. All rights reserved.
//

import SwiftUI

struct ShopSectionHeaderView: View {

    @ObservedObject var viewModel: ShopSectionHeaderViewModel

    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 2.0) {
                Text(viewModel.title)
                    .font(.title2)
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
                            .font(.subheadline)
                            .foregroundColor(Color("TimeRemainingColor"))
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .frame(height: UIFont.preferredFont(forTextStyle: .subheadline).pointSize)
                }
            }
            .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
        }
        .background(Color("PrimaryBackgroundColor"))
    }
}

struct ShopSectionHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ShopSectionHeaderView(viewModel: createPopulatedSectionHeaderViewModel())
    }
    
    static func createPopulatedSectionHeaderViewModel() -> ShopSectionHeaderViewModel {
        let viewModel = ShopSectionHeaderViewModel(
            title: "Featured Items",
            endDate: .nextShopRefresh
        )
        viewModel.timeRemainingCountdownText = "5 minutes 12 seconds"
        return viewModel
    }
}
