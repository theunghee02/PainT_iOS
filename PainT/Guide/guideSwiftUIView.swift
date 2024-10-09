//
//  guideSwiftUIView.swift
//  PainT
//
//  Created by 최승희 on 8/18/24.
//
// 첫 번째 가이드 화면

import SwiftUI
import AVKit

struct guideSwiftUIView: View {
    var currentCount: Int = 1
    var totalCount: Int = 2
    var exerciseName: String = "Wall_Squats"
    var exercise2Name: String = "Seated_Hamstring_Stretch"
    
    // 영상 관련
    @State private var player: AVPlayer?
    @State private var playerStatusObservation: NSKeyValueObservation?
    
    // 아파요 버튼 알림 여부
    @State private var painAlert = false
    @State private var navigateToNextPage = false
    
    // 치유 달성도
    @Binding var percent: Int
    
    var body: some View {
        VStack(spacing: 0) {
            // 아파요 버튼 후, 페이지 이동
            NavigationLink(destination: lastGuideSwiftUIView(), isActive: $navigateToNextPage) {
                EmptyView()
            }
            
            // 횟수
            Text("\(currentCount) / \(totalCount)")
                .padding(.bottom, 10)
            
            // 운동 이름
            Text("\(exerciseName)")
                .font(.system(size: 24))
            
            // 가이드 영상
            if let player = player {
                VideoPlayer(player: player)
                    .frame(width: UIScreen.main.bounds.width * 0.86, height: UIScreen.main.bounds.width * 0.86)
                    .padding(.horizontal, 30)
                    .padding(.vertical, 15)
//                    .padding(30)
            } else {
                Text("Loading video...")
                    .frame(width: UIScreen.main.bounds.width * 0.86, height: UIScreen.main.bounds.width * 0.86)
                    .padding(30)
            }
            
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
                    //                        .font(.system(size: 18))
                        .fontWeight(.semibold)
                } // VStack
                .padding(.vertical, 15)
                
                Spacer()
            } // HStack
            .frame(width: 300)
            .background(Color(hex: 0xF0F0F0))
            .clipShape(RoundedRectangle(cornerRadius: 15))
            
            Spacer()
            
            // 아파요 버튼, 재생 버튼
            
                HStack(spacing: 0) {
                    // 아파요 버튼
                    Button(action: {
                        painAlert = true
                    }) {
                        ZStack {
                            Rectangle()
                                .frame(width: UIScreen.main.bounds.width * 0.29, height: 60)
                                .foregroundColor(Color(hex: 0x919296))
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                            
                            // 요소
                            HStack {
                                // 요소 - 통증 이미지
                                Image("pain6")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                
                                // 요소 - Text
                                Text("아파요")
                                    .foregroundStyle(Color(.white))
                                    .fontWeight(.heavy)
                            } // HStack
                        } // ZStack
                    } // Button
                    .alert(isPresented: $painAlert) {
                        Alert(
                            title: Text("이 가이드가 아프신가요?"),
                            message: Text("아파서 해당 가이드를 중단하고 싶으시다면, '예'를 선택해주세요."),
                            primaryButton: .default(Text("예"), action: {
                                navigateToNextPage = true
                            }),
                            secondaryButton: .cancel(Text("아니오"))
                        )
                    }
                    
                    Spacer()
                    
                    // 치유 달성 완료 버튼
                    Button(action: increasePercent) {
                        ZStack {
                            Rectangle()
                                .frame(width: UIScreen.main.bounds.width * 0.5, height: 60)
                                .foregroundColor(percent == 100 ? Color(hex: 0xF0F0F0) : Color(hex: 0x919296))
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                            
                            // title
                            Text("치유 달성 완료")
                                .foregroundStyle(Color(.white))
                                .fontWeight(.heavy)
                        } // ZStack
                    } // Button
                    .disabled(percent == 100)
                } // HStack
                .padding(.horizontal, 30)
                .padding(.vertical, 15)
            
            Spacer()
            
            // 하단 버튼
            bottomButtonSwiftUIView(nextDestination: AnyView(lastGuideSwiftUIView()))
        } // VStack
        .onAppear {
            // AVPlayer 초기화 및 URL 설정
            let player = AVPlayer(url: URL(string: "http://chi-iu.com/videos/download/\(exerciseName).mp4")!)
            
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
        } // .onAppear
        .onDisappear {
            // 관찰자 해제
            playerStatusObservation = nil
        } // .onDisappear
    } // body
    
    func increasePercent() {
        if percent < 100 {
            percent += 5 // 가이드 목록 개수 받아와서 계산해야 함
        }
    }
} // guideSwiftUIView
