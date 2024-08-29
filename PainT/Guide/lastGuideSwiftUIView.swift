//
//  lastGuideSwiftUIView.swift
//  PainT
//
//  Created by 최승희 on 8/24/24.
//
// 두 번째 가이드 화면(마지막 화면)

import SwiftUI
import AVKit

struct lastGuideSwiftUIView: View {
    var currentCount: Int = 2
    var totalCount: Int = 2
    var exerciseName: String = "Seated_Hamstring_Stretch"
    
    // 아파요 버튼 알림 여부
    @State private var painAlert = false
    // 아파요 버튼 누른 후 페이지 이동
    @State private var navigateToNextPage = false
    
    var body: some View {
        VStack(spacing: 0) {
            // 아파요 버튼 후, 페이지 이동
            NavigationLink(destination: tabSwiftUIView(), isActive: $navigateToNextPage) {
                EmptyView()
            }
            
            Text("\(currentCount) / \(totalCount)")
                .padding(.bottom, 10)
            Text("\(exerciseName)")
                .font(.system(size: 24))
            VideoPlayer(player: AVPlayer(url: URL(string: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")!))
//            VideoPlayer(player: AVPlayer(url: URL(string: "http://chi-iu.com/videos/download/\(exerciseName).mp4")!))
                .frame(width: UIScreen.main.bounds.width * 0.86, height: UIScreen.main.bounds.width * 0.86)
                .padding(30)
            
            // 마지막 가이드 Text
            VStack(alignment: .leading) {
                // Title
                Text("마지막 가이드입니다")
//                    .foregroundStyle(Color("AccentColor"))
                    .foregroundColor(Color(hex:0x252525))
                    .fontWeight(.heavy)
                    .padding(30)
            } // VStack
            .frame(width: UIScreen.main.bounds.width * 0.86)
            .background(Color(hex: 0xF0F0F0))
            .clipShape(RoundedRectangle(cornerRadius: 15))
            
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
                
                // 재생 버튼
                ZStack {
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width * 0.5, height: 60)
                        .foregroundColor(Color(hex: 0x919296))
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                    
                    // 재생 표시의 삼각형
                    Image("triangle")
                } // ZStack
            } // HStack
            .padding(30)
            
            Spacer()
            
            // 하단 버튼
            HStack(spacing: 0) {
                NavigationLink(destination: guideSwiftUIView()) {
                    Text("이전")
                        .foregroundColor(Color(hex:0x252525))
                        .frame(minHeight: 50)
                        .frame(width: UIScreen.main.bounds.width * 0.4)
                        .background(Color(hex: 0xD9D9D9))
                }
                NavigationLink(destination: tabSwiftUIView()) {
                    Text("다음")
                        .foregroundColor(Color(hex:0x252525))
                        .frame(minHeight: 50)
                        .frame(width: UIScreen.main.bounds.width * 0.6)
                        .background(Color("AccentColor"))
                }
            } // HStack
        } // VStack
    }
}

#Preview {
    lastGuideSwiftUIView()
}
