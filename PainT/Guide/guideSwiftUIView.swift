//
//  guideSwiftUIView.swift
//  PainT
//
//  Created by 최승희 on 8/18/24.
//

import SwiftUI

struct guideSwiftUIView: View {
    var currentCount: Int = 1
    var totalCount: Int = 2
    var excerciseName: String = "Wall_Squats"
    var excercise2Name: String = "Seated_Ham-string_Stretch"
    
    var body: some View {
        VStack(spacing: 0) {
            Text("\(currentCount) / \(totalCount)")
                .padding(.bottom, 10)
            Text("\(excerciseName)")
                .font(.system(size: 24))
            AsyncImage(url: URL(string: "http://chi-iu.com/videos/download/\(excerciseName)"))
                .frame(width: 300, height: 300)
                .padding(.top, 50)
                .padding(.horizontal, 30)
            
            Spacer()
            
            // 다음 가이드
            HStack {
                AsyncImage(url: URL(string: "http://chi-iu.com/videos/download/\(excercise2Name)"))
                    .frame(width: 70, height: 70)
                    .padding([.vertical, .leading], 15)
                    .padding(.trailing, 20)
                
                // Texts
                VStack(alignment: .leading) {
                    // Title
                    Text("다음 가이드")
                        .foregroundStyle(Color("AccentColor"))
                    
                    // 운동 이름
                    Text("\(excercise2Name)")
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
            bottomButtonSwiftUIView(nextDestination: AnyView(_2guideSwiftUIView()))
        } // VStack
    }
}

#Preview {
    guideSwiftUIView()
}
