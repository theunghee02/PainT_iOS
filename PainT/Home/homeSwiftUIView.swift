//
//  homeSwiftUIView.swift
//  PainT
//
//  Created by 최승희 on 4/29/24.
//

import SwiftUI

struct homeSwiftUIView: View {
    @State var diseaseName: String = "척추관 협착증"
    @State var count: String = "3"
    @State var percent: CGFloat = 10
    @State var exercises: [String] = ["Wall_Squats", "Seated_Hamstring_Stretch"]
    @State var exerciseTimes: [String] = ["15sec", "15sec"]
    @State var totalTime: String = "30초"
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
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
                    HStack {
                        // 개수 & 시간
                        Text("총 \(exercises.count)개 | 🕒 \(totalTime)")
                            .padding(.leading, 20)
                        
                        Spacer()
                        
                        // [버튼] 추천 가이드 시작하기
                        NavigationLink(destination: guideSwiftUIView()) {
                            Text("추천 가이드 시작하기")
                                .fontWeight(.semibold)
                                .foregroundColor(Color(hex: 0x252525)) // 글씨 색상
                                .padding(14)
                                .background(Color("AccentColor"))
                                .cornerRadius(14)
                        }
                        .padding(.trailing, 20)
                    } // HStack
                    .padding(.vertical, 20)
//                    .background(Color(.red))
                    
                    // 루틴 리스트
                    ForEach(0..<exercises.count, id: \.self) { idx in
                        exerciseRow(exerciseName: exercises[idx], exerciseTime: exerciseTimes[idx])
                    }
                } // VStack
                .background(Color(red: 0.94, green: 0.94, blue: 0.94))
                .clipShape(RoundedRectangle(cornerRadius: 25))
                
                // [버튼] 가이드 추가하기
                HStack {
                    // 가이드 추가하기
                    HStack{
                        
                    }
                }
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
            NavigationLink(destination: guideSwiftUIView()) {
                HStack {
                    AsyncImage(url: /*@START_MENU_TOKEN@*/URL(string: "https://example.com/icon.png")/*@END_MENU_TOKEN@*/)
                        .frame(width: 70, height: 70)
                        .padding(.leading, 20)
                        .padding(.vertical, 15)
                    Text("\(exerciseName)")
                        .padding(.leading, 20)
                        .foregroundColor(Color(.black))
                    Spacer()
                    Text("\(exerciseTime)")
                        .padding(.trailing, 20)
                        .foregroundColor(Color(.black))
                } // HStack
                .overlay(
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(Color(hex: 0x9E9E9E)),
                    alignment: .bottom
                )
            } // NavigationLink
        } // body
        return body
    } //
} // homeSwiftUIView

#Preview {
    homeSwiftUIView()
}
