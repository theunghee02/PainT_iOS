//
//  videoPlayerView.swift
//  PainT
//
//  Created by 최승희 on 8/25/24.
//

//import UIKit
//import SwiftUI
//import AVKit
//
//struct VideoPlayerView: UIViewRepresentable {
//    func makeUIView(context: Context) -> UIView {
//        <#code#>
//    }
//    
//    func updateUIView(_ uiView: UIView, context: Context) { }
//}
//
//class PlayerContainer: UIView {
//    var player: AVPlayer
//    var playerItem: AVPlayerItem?
//    
//    init(player: AVPlayer) {
//        self.player = player
//        super.init(frame: .zero)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    func configurePlayer() {
//        let playerLayer = AVPlayerLayer(player: self.player)
//        self.playerItem = player.currentItem
//        player.play()
//        layer.addSublayer(playerLayer)
//    }
//
//}
