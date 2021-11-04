//
//  CreatorCodeView.swift
//  Item Shop Demo
//
//  Created by Michael Hinton on 10/30/21.
//  Copyright © 2021 HinTech, LLC. All rights reserved.
//

import SwiftUI

struct CreatorCodeView: View {
    @Environment(\.openURL) var openUrl
    
    var body: some View {
        Button(action: openSupportAction) {
            HStack(spacing: 10) {
                Image("rl-trading-post-logo")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .padding([.leading], 10)
                VStack(spacing: 3) {
                    Text("support_rl_trading_post_title".localized)
                        .font(.headline)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("support_rl_trading_post_body".localized)
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding([.top, .bottom, .trailing], 10)
            }
            .background(Color(hex: "#1DABEB"))
            .cornerRadius(10)
        }
        .padding(EdgeInsets(top: 12, leading: 12, bottom: 0, trailing: 12))
    }
    
    private func openSupportAction() {
        openUrl(URL(string: "https://rltradingpost.app/support_a_creator")!)
    }
}

struct CreatorCodeView_Previews: PreviewProvider {
    static var previews: some View {
        CreatorCodeView()
    }
}
