//
//  guideSwiftUIView.swift
//  PainT
//
//  Created by 최승희 on 8/18/24.
//

import SwiftUI
import AVKit

struct guideSwiftUIView: View {
    var currentCount: Int = 1
    var totalCount: Int = 2
    var exerciseName: String = "Wall_Squats"
    var exercise2Name: String = "Seated_Hamstring_Stretch"
    
    @State private var player: AVPlayer?
    @State private var playerStatusObservation: NSKeyValueObservation?

    var body: some View {
        VStack(spacing: 0) {
            Text("\(currentCount) / \(totalCount)")
                .padding(.bottom, 10)
            Text("\(exerciseName)")
                .font(.system(size: 24))
            
            if let player = player {
                VideoPlayer(player: player)
                    .frame(width: 300, height: 300)
                    .padding(.top, 50)
                    .padding(.horizontal, 30)
            } else {
                Text("Loading video...")
                    .frame(width: 300, height: 300)
                    .padding(.top, 50)
                    .padding(.horizontal, 30)
            }
            
            Spacer()
            
            // 다음 가이드
            HStack {
                AsyncImage(url: URL(string: "http://chi-iu.com/videos/download/image/\(exercise2Name)")) { result in
                    result
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                }
                    .frame(width: 70, height: 70)
                    .padding([.vertical, .leading], 15)
                    .padding(.trailing, 20)
                
                // Texts
                VStack(alignment: .leading) {
                    // Title
                    Text("다음 가이드")
                        .foregroundStyle(Color("AccentColor"))
                    
                    // 운동 이름
                    Text("\(exercise2Name)")
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                } // VStack
                .padding(.vertical, 15)
                
                Spacer()
            } // HStack
            .frame(width: 300)
            .background(Color(hex: 0xF0F0F0))
            .clipShape(RoundedRectangle(cornerRadius: 15))
            
            ZStack {
                Rectangle()
                    .frame(width: 300, height: 60)
                    .foregroundColor(Color(hex: 0x919296))
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                
                // 재생 버튼
                Image("triangle")
            } // ZStack
            .padding(30)
            
            // 하단 버튼
            bottomButtonSwiftUIView(nextDestination: AnyView(lastGuideSwiftUIView()))
        } // VStack
        .onAppear {
            // AVPlayer 초기화 및 URL 설정
            let player = AVPlayer(url: URL(string: "http://chi-iu.com/videos/download/\(exerciseName)")!)
            
            // AVPlayerItem의 status 속성 관찰
            playerStatusObservation = player.currentItem?.observe(\.status, options: [.new, .old]) { item, change in
                switch item.status {
                case .readyToPlay:
                    print("Video is ready to play")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        player.play() // 비디오 준비 완료 시 자동 재생
                    }

                case .failed:
                    if let error = item.error {
                        print("Failed to load video: \(error.localizedDescription)")
                    }

                case .unknown:
                    print("Unknown status")

                @unknown default:
                    print("A new status was introduced that we're not handling")
                }
            }
            
            self.player = player
        }
        .onDisappear {
            // 관찰자 해제
            playerStatusObservation = nil
        }
    }
}

#Preview {
    guideSwiftUIView()
}
