//
//  testVideoSwiftUIView.swift
//  PainT
//
//  Created by 최승희 on 8/28/24.
//

import SwiftUI
import AVKit
import AVFoundation

struct testVideoSwiftUIView: View {
    @State private var player: AVPlayer?
    
    var body: some View {
        VStack {
            if let player = player {
                VideoPlayer(player: player)
                    .frame(height: 300)
            } else {
                Text("Loading video...")
            }
        }
        .onAppear {
            setupPlayer()
        }
    }
    
    private func setupPlayer() {
        // 오디오 세션 설정
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .moviePlayback, options: [])
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Failed to set audio session category.")
        }
        
        // AVPlayer 초기화
        if let url = URL(string: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4") {
            player = AVPlayer(url: url)
        }
    }
}


#Preview {
    testVideoSwiftUIView()
}

//import SwiftUI
//import AVKit
//
//struct testVideoSwiftUIView: View {
//    @State var player: AVPlayer?
//    @State var isPlaying: Bool = false
//    
//    init() {
//        if let url = Bundle.main.url(forResource: "Wall_Squats", withExtension: "mp4") {
//            _player = State(initialValue: AVPlayer(url: url))
//        } else {
//            print("Error: Video file not found.")
//        }
//    }
//    
//    var body: some View {
//        VStack {
//            if let player = player {
//                VideoPlayer(player: player)
//                    .frame(width: 320, height: 180, alignment: .center)
//
//                Button {
//                    isPlaying ? player.pause() : player.play()
//                    isPlaying.toggle()
//                    player.seek(to: .zero)
//                } label: {
//                    Image(systemName: isPlaying ? "stop" : "play")
//                        .padding()
//                }
//            } else {
//                Text("비디오를 로드할 수 없습니다.")
//            }
//        }
//    }
//}
