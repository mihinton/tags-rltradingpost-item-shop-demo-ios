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
                Text("rarity_category".localized(item.rarity.localized, item.category.localized))
                    .font(.footnote)
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 4.0, x: 0, y: 0)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                
                HStack(spacing: 4) {
                    Spacer()
                    
                    ZStack {
                        Text(item.certification.localized)
                            .font(.footnote)
                            .foregroundColor(.white)
                            .padding([.vertical], 2.0)
                            .padding([.horizontal], 4.0)
                    }
                    .background(Color.init(hex: "#80000000"))
                    .cornerRadius(4)
                    .opacity(item.isCertified ? 1.0 : 0.0)
                    
                    if item.isPainted {
                        ZStack {
                            Text(item.paint.localized)
                                .font(.footnote)
                                .foregroundColor(item.isPaintLight ? .black : .white)
                                .padding([.vertical], 2.0)
                                .padding([.horizontal], 4.0)
                        }
                        .background(Color(item.paintUiColor))
                        .cornerRadius(4)
                    }
                }
                .padding([.top], 2.0)
                
                HStack(spacing: 4.0) {
                    Spacer()
                    
                    if !item.isTradable {
                        ItemShopExclusiveView()
                    }
                    
                    ItemPriceView(price: item.price)
                }
                .padding([.top], 8.0)
            }
            .padding([.all], 6.0)
        }
        
        struct ItemShopExclusiveView: View {
            var body: some View {
                ZStack {
                    HStack(spacing: 3.0) {
                        Image("untradable")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Text("shop_exclusive".localized)
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                    .frame(height: UIFont.preferredFont(forTextStyle: .footnote).pointSize + 4.0)
                    .padding([.vertical], 2.0)
                    .padding([.horizontal], 4.0)
                }
                .background(Color.init(hex: "#B82100"))
                .cornerRadius(4)
            }
        }
        
        struct ItemPriceView: View {
            let price: Int
            
            var body: some View {
                ZStack {
                    HStack(spacing: 3.0) {
                        Image("credits")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Text(price > 0 ? "\(price)" : "price_free".localized)
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                    .frame(height: UIFont.preferredFont(forTextStyle: .footnote).pointSize + 4.0)
                    .padding([.vertical], 2.0)
                    .padding([.horizontal], 4.0)
                }
                .background(Color.init(hex: "#111111"))
                .cornerRadius(4)
            }
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
