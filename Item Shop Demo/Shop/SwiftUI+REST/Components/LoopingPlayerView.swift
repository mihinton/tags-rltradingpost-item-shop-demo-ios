//
//  LoopingPlayerView.swift
//  Item Shop Demo
//
//  Created by Michael Hinton on 2/14/22.
//  Copyright © 2022 HinTech, LLC. All rights reserved.
//  https://schwiftyui.com/swiftui/playing-videos-on-a-loop-in-swiftui/
//

import SwiftUI
import AVKit
import AVFoundation

struct LoopingPlayerView: UIViewRepresentable {

    let url: String

    init(url: String) {
        self.url = url
    }

    func makeUIView(context: Context) -> UIView {
        let player = LoopingPlayerUIView(frame: .zero, url: url)
        player.url = url
        return player
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LoopingPlayerView>) {}
}

class LoopingPlayerUIView: UIView {

    var url: String!

    private let playerLayer = AVPlayerLayer()
    private var playerLooper: AVPlayerLooper?
    
    init(frame: CGRect, url: String) {
        super.init(frame: frame)
        
        guard let fileUrl = URL(string: url) else { return }
        let asset = AVAsset(url: fileUrl)
        let item = AVPlayerItem(asset: asset)
        
        let player = AVQueuePlayer()
        playerLayer.player = player
        playerLayer.videoGravity = .resizeAspectFill
        layer.addSublayer(playerLayer)
        
        playerLooper = AVPlayerLooper(player: player, templateItem: item)
        
        player.play()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
}
