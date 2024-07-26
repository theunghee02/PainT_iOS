//
//  homeSwiftUIView.swift
//  PainT
//
//  Created by 최승희 on 4/29/24.
//

import SwiftUI

struct homeSwiftUIView: View {
    @State var diseaseName: String = "허리 디스크"
    @State var count: String = "21"
    @State var percent: CGFloat = 30
    @State var exercises: [String] = ["랫 풀다운", "랫 풀다운", "랫 풀다운", "랫 풀다운", "랫 풀다운", "랫 풀다운", "랫 풀다운", "랫 풀다운"]
    @State var exerciseTimes: [String] = ["15min", "15min", "15min", "50sec", "50sec", "50sec", "50sec", "50sec"]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // 질환명
                HStack(spacing: 0) {
                    Text("질환명 | ")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                    Text("\(diseaseName)")
                        .font(.system(size: 20))
                } // HStack
                .padding(.bottom, 25.0)
                .padding(.leading, 20.0)
                
                // 치유 달성도
                VStack {
                    // 제목 & 횟수
                    GeometryReader { geometry in
                        HStack(alignment: .center, spacing: 0) {
                            Text("치유 달성도")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .padding(.trailing, 80)
                            Spacer()
                            Text("\(count)")
                                .font(.system(size: 24))
                                .fontWeight(.bold)
                            Text("번째 치유 중")
                        } // HStack
                        .frame(width: geometry.size.width)
                    } // GeometryReader
                    .padding(.bottom, 17.0)
                    
                    // 막대 & 퍼센트
                    HStack(alignment: .center) {
                        // 막대
                        GeometryReader { geometry in
                            ZStack(alignment: .leading) {
                                // 전체 바
                                Rectangle()
                                    .fill(Color(red: 0.63, green: 0.63, blue: 0.63))
                                    .frame(height: 10)
                                    .clipShape(RoundedRectangle(cornerRadius: 100))
                                
                                // 퍼센트 바
                                Rectangle()
                                    .fill(Color("AccentColor"))
                                    .frame(width: geometry.size.width * (percent / 100), height: 10)
                                    .clipShape(RoundedRectangle(cornerRadius: 100))
                            } // ZStack
                        } // GeometryReader
                        .padding(.top, 5.0)
                        
                        // 퍼센트 텍스트
                        Text("\(Int(percent))%")
                    } // HStack
                } // VStack
                .padding(.horizontal, 20.0)
                .padding(.bottom, 40)
                
                // 추천 가이드 루틴
                VStack(alignment: .center, spacing: 0) {
                    // [버튼] 추천 가이드 시작하기
                    GeometryReader { geometry in
                        HStack {
                            Button(action: {
                                
                            }) {
                                Text("추천 가이드 시작하기")
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color(hex: 0x252525)) // 글씨 색상
                                    .padding(.vertical, 14.0)
                                    .padding(.horizontal)
                                    .background(Color("AccentColor"))
                                    .cornerRadius(14)
                                    .frame(width: geometry.size.width - 40)
                            } // Button
                            .frame(maxWidth: .infinity)
                        } // HStack
                        .padding(.horizontal, 20)
//                        .background(Color(.red))
                    } // GeometryReader
                    .padding(.top, 20.0)
                    .frame(height: 85)
                    .background(Color(.blue))
                    
                    // 루틴 리스트
                    ForEach(0..<exercises.count, id: \.self) { idx in
                        exerciseRow(exerciseName: exercises[idx], exerciseTime: exerciseTimes[idx])
                    }
                } // VStack
                .background(Color(red: 0.94, green: 0.94, blue: 0.94))
                .clipShape(RoundedRectangle(cornerRadius: 25))
            } // VStack
            .padding(.top, 30.0)
            .padding(.horizontal, 13.0)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image("appIcon")
                }
            }
        } // ScrollView
    } // body
    
    // Exercise Row
    func exerciseRow(exerciseName: String, exerciseTime: String) -> some View {
        var body: some View {
            HStack {
                Rectangle()
                    .frame(width: 70, height: 70)
                    .padding(.leading, 20)
                    .padding(.vertical, 15)
                Text("\(exerciseName)")
                    .padding(.leading, 20)
                Spacer()
                Text("\(exerciseTime)")
                    .padding(.trailing, 20)
            } // HStack
//            .background(Color(.blue))
            .overlay(
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color(hex: 0x9E9E9E)),
                alignment: .bottom
            )
        } // body
        return body
    } //
} // homeSwiftUIView

#Preview {
    homeSwiftUIView()
}
