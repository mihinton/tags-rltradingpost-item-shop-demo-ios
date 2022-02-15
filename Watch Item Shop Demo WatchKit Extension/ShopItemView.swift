//
//  ShopItemView.swift
//  Watch Item Shop Demo WatchKit Extension
//
//  Created by Michael Hinton on 2/15/22.
//  Copyright © 2022 HinTech, LLC. All rights reserved.
//

import SwiftUI

struct ShopItemView: View {

    @ObservedObject var viewModel: ShopItemViewModel

    @State private var contentHeight: CGFloat = .zero

    var body: some View {
        ZStack {
            if contentHeight > 0 {
                ItemIconsView(viewModel: viewModel, contentHeight: contentHeight)
            }
            
            ItemInformationView(item: viewModel.item)
                .background(GeometryReader { geometry in
                    // I know this isn't great,
                    // but I couldn't get PreferenceKey to work here
                    setupContentHeight(geometry: geometry)
                })
        }
        .background(ItemCardBackgroundView(item: viewModel.item))
        .cornerRadius(10)
        .padding([.vertical], 4.0)
        .padding([.horizontal], 8.0)
    }
    
    private func setupContentHeight(geometry: GeometryProxy) -> some View {
        DispatchQueue.main.async { self.contentHeight = geometry.size.height }
        return Color.clear
    }
}

extension ShopItemView {

    struct ItemInformationView: View {
        let item: RocketLeagueItem
        
        var body: some View {
            VStack(spacing: .zero) {
                Text(item.name)
                    .font(.headline)
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 4.0, x: 0, y: 0)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                Text(item.category.localized)
                    .font(.footnote)
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 4.0, x: 0, y: 0)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                
                HStack(spacing: 4.0) {
                    Spacer()
                    
                    let infoContainerVerticalPadding: CGFloat = 2.0
                    let infoContainerHorizonalPadding: CGFloat = 4.0
                    let infoContainerSize = UIFont.preferredFont(forTextStyle: .footnote).pointSize + infoContainerVerticalPadding * 2
                    
                    if !item.isTradable {
                        ZStack {
                            Image("untradable")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: infoContainerSize)
                                .padding([.vertical], infoContainerVerticalPadding)
                                .padding([.horizontal], infoContainerHorizonalPadding)
                        }
                        .background(Color.init(hex: "#B82100"))
                        .cornerRadius(4)
                    }
                    
                    if item.isCertified {
                        ZStack {
                            Text(item.certification.localized)
                                .font(.footnote)
                                .foregroundColor(.white)
                                .padding([.vertical], infoContainerVerticalPadding)
                                .padding([.horizontal], infoContainerHorizonalPadding)
                        }
                        .background(Color.init(hex: "#80000000"))
                        .cornerRadius(4)
                    }
                    
                    if item.isPainted {
                        Circle()
                            .foregroundColor(Color(item.paintUiColor))
                            .frame(width: infoContainerSize, height: infoContainerSize)
                    }
                    
                    ZStack {
                        Text(item.price > 0 ? "\(item.price)c" : "price_free".localized)
                            .font(.footnote)
                            .foregroundColor(.white)
                            .padding([.vertical], 2.0)
                            .padding([.horizontal], 4.0)
                    }
                    .background(Color.init(hex: "#111111"))
                    .cornerRadius(4)
                }
                .padding([.top], 2.0)
            }
            .padding([.all], 6.0)
        }
    }
    
    struct ItemIconsView: View {
        @ObservedObject var viewModel: ShopItemViewModel
        let contentHeight: CGFloat
        
        var body: some View {
            let iconPadding: CGFloat = 4
            HStack(spacing: .zero) {
                let iconSize = max(contentHeight - iconPadding * 2, .zero)
                if let imageData = viewModel.imageData {
                    Image(uiImage: UIImage(data: imageData) ?? UIImage())
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: iconSize, height: iconSize)
                        .padding([.all], iconPadding)
                }
                Spacer()
            }
            .frame(height: contentHeight)
        }
    }
    
    struct ItemCardBackgroundView: View {
        let item: RocketLeagueItem
        
        var body: some View {
            LinearGradient(
                gradient: Gradient(stops: [
                    .init(color: .black, location: -0.1),
                    .init(color: Color(item.rarityUiColor), location: 1.0)
                ]),
                startPoint: .top,
                endPoint: .bottomTrailing
            )
        }
    }

}

struct ShopItemView_Previews: PreviewProvider {
    static var previews: some View {
        ShopItemView(
            viewModel: ShopItemViewModel(
                item: RocketLeagueItem.fake(),
                isFeatured: true
            )
        )
    }
}
