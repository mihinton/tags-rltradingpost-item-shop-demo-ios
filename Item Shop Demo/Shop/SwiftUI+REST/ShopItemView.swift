//
//  ShopItemView.swift
//  Item Shop Demo
//
//  Created by Michael Hinton on 1/24/22.
//  Copyright © 2022 HinTech, LLC. All rights reserved.
//

import SwiftUI

struct ShopItemView: View {

    let viewModel: ShopItemViewModel

    @State private var contentHeight: CGFloat = .zero

    var body: some View {
        ZStack {
            ItemInformationView(item: viewModel.item)
                .background(GeometryReader { geometry in
                    // I know this isn't great,
                    // but I couldn't get PreferenceKey to work here
                    setupContentHeight(geometry: geometry)
                })
            
            if contentHeight > 0 {
                ItemIconsView(viewModel: viewModel, contentHeight: contentHeight)
            }
        }
        .background(ItemCardBackgroundView(item: viewModel.item))
        .cornerRadius(10)
        .padding([.vertical], 6.0)
        .padding([.horizontal], 12.0)
    }
    
    private func setupContentHeight(geometry: GeometryProxy) -> some View {
        DispatchQueue.main.async { self.contentHeight = geometry.size.height }
        return Color.clear
    }
}

extension ShopItemView {

    struct ItemInformationView: View {
        let item: ShopItem
        
        var body: some View {
            VStack(spacing: 0.0) {
                Text(item.name)
                    .font(.title)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                Text("rarity_category".localized(item.rarity.localized, item.category.localized))
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                
                HStack(spacing: 6.0) {
                    Spacer()
                    
                    ZStack {
                        Text(item.certification.localized)
                            .font(.footnote)
                            .foregroundColor(.white)
                            .padding([.vertical], 3.0)
                            .padding([.horizontal], 6.0)
                    }
                    .background(Color.init(hex: "#80000000"))
                    .cornerRadius(4)
                    .opacity(item.certification != "None" ? 1.0 : 0.0)
                    
                    if item.color != "None" {
                        ZStack {
                            Text(item.color.localized)
                                .font(.footnote)
                                .foregroundColor(.white)
                                .padding([.vertical], 3.0)
                                .padding([.horizontal], 6.0)
                        }
                        .background(Color(ColorUtils.getPaintedColor(item.color)))
                        .cornerRadius(4)
                    }
                }
                .padding([.top], 4.0)
                
                HStack(spacing: 5.0) {
                    Spacer()
                    
                    if !item.isTradable {
                        ItemShopExclusiveView()
                    }
                    
                    ItemPriceView(price: item.price)
                }
                .padding([.top], 24.0)
            }
            .padding([.all], 10.0)
        }
    }
    
    struct ItemIconsView: View {
        let viewModel: ShopItemViewModel
        let contentHeight: CGFloat
        
        var body: some View {
            let iconPadding: CGFloat = 10.0
            HStack(spacing: 0.0) {
                let iconSize = max(contentHeight - iconPadding * 2, .zero)
                if let imageData = viewModel.imageData {
                    Image(uiImage: UIImage(data: imageData) ?? UIImage())
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: iconSize, height: iconSize)
                        .padding([.all], iconPadding)
                }
                
                if viewModel.isFeatured {
                    Image(viewModel.categoryImageFileName)
                        .resizable()
                        .frame(maxWidth: .infinity)
                        .padding([.trailing], 10.0)
                        .aspectRatio(contentMode: .fill)
                        .opacity(0.05)
                } else {
                    Spacer()
                }
            }
            .frame(height: contentHeight)
        }
    }
    
    struct ItemCardBackgroundView: View {
        let item: ShopItem
        
        var body: some View {
            LinearGradient(
                gradient: Gradient(stops: [
                    .init(color: .black, location: 0.0),
                    .init(color: .black, location: 0.35),
                    .init(color: Color(ColorUtils.getRarityColor(item.rarity)), location: 1.0)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        }
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
                .padding([.horizontal], 6.0)
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
                .padding([.horizontal], 6.0)
            }
            .background(Color.init(hex: "#111111"))
            .cornerRadius(4)
        }
    }

}

struct ShopItemView_Previews: PreviewProvider {
    static var previews: some View {
        ShopItemView(
            viewModel: ShopItemViewModel(
                item: ShopItem.fake(),
                isFeatured: true
            )
        )
    }
}
