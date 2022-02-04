//
//  ShopItemView.swift
//  Item Shop Demo
//
//  Created by Michael Hinton on 1/24/22.
//  Copyright © 2022 HinTech, LLC. All rights reserved.
//

import SwiftUI

struct ShopItemView: View {

    let item: ShopItem

    var body: some View {
        let gradient = Gradient(stops: [
            .init(color: .black, location: 0.0),
            .init(color: .black, location: 0.35),
            .init(color: Color(ColorUtils.getRarityColor(item.rarity)), location: 1.0)
        ])

        ZStack {
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
                        ZStack {
                            HStack(spacing: 3.0) {
                                Image("untradable")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                Text("Shop Exclusive")
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
                    
                    ZStack {
                        HStack(spacing: 3.0) {
                            Image("credits")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            Text(item.price > 0 ? "\(item.price)" : "FREE".localized)
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
                .padding([.top], 24.0)
            }
            .padding([.all], 10.0)
        }
        .background(LinearGradient(gradient: gradient, startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(10)
        .padding([.vertical], 6.0)
        .padding([.horizontal], 12.0)
    }
}

struct ShopItemView_Previews: PreviewProvider {
    static var previews: some View {
        ShopItemView(item: ShopItem.fake())
    }
}
