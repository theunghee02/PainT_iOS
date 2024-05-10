//
//  painRecordResultSwiftUIView.swift
//  PainT
//
//  Created by 최승희 on 5/5/24.
//

import SwiftUI

struct painRecordResultSwiftUIView: View {
    var username: String = "수정"
    
    // 선택한 날짜
    var selectedTime : Date = Date()
     
    // Intensity
    let intensityNum : Int = 2
    let intensityText : String = "가벼운 통증"
    
    // 날짜를 원하는 형식의 문자열로 변환
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY\nMM.dd"
        return formatter
    }()
    // 시간 문자열 변환
    let timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        return formatter
    }()
    
    // 트리거
    var trigger : String = "엎드려 있을 때"
    
    // 느낌
    var feelings : [String] = ["날카로운 느낌",
                               "누르는 듯한 느낌"]
    
    var body: some View {
        VStack {
            Spacer()
            
            // 상위 문구
            Text("\(username)님의\n기록이 완성되었습니다")
                .multilineTextAlignment(.center)
                .foregroundStyle(.white)
                .font(.system(size: 24))
            
            // 기록 카드
            VStack {
                // 상위 항목
                HStack {
                    // 날짜 및 시간
                    VStack(alignment: .leading) {
                        // 텍스트로 오늘의 날짜 표시
                        Text(dateFormatter.string(from: selectedTime))
                            .foregroundStyle(.white)
                            .font(.system(size: 48))
                            .fontWeight(/*@START_MENU_TOKEN@*/.medium/*@END_MENU_TOKEN@*/)
                        Text(timeFormatter.string(from: selectedTime))
                            .foregroundStyle(.white)
                            .font(.system(size: 14))
                    }
                    .padding()
                    
                    // 강도 아이콘
                    VStack {
                        Image("pain\(intensityNum)")
                        Text("\(intensityText)")
                            .foregroundStyle(.white)
                    } // VStack
                    .padding(.horizontal, 10)
                    .padding(.vertical, 20.0)
                    .background(Color(hex: 0x0E0E0E, alpha: 0.5))
                    .cornerRadius(27)
                } // HStack
                .padding(20)
                
                // 하위 항목
                HStack(spacing: 5) {
                    // 3D 신체
                    Rectangle()
                        .frame(width: 150, height: 300)
                        .foregroundStyle(.white)
                    
                    // 트리거 및 느낌
                    VStack(alignment: .trailing, spacing: 20) {
                        ForEach(0..<feelings.count+1, id: \.self) { idx in
                            if idx == 0 {
                                resultRow(text: trigger)
                            }
                            else {
                                resultRow(text: feelings[idx-1])
                            }
                        }
                    }
                    .padding()
                }
            } // VStack
            .overlay(
                RoundedRectangle(cornerRadius: 60) // 원하는 cornerRadius 값으로 설정
                    .stroke(Color.black, lineWidth: 1) // 테두리 색상 및 두께 지정
            )
//            .background(Color(hex: 0x333333))
            
            Spacer()
            
            // 하단 버튼
            HStack(spacing: 0) {
                NavigationLink(destination: tabSwiftUIView().navigationBarBackButtonHidden()) {
                    Text("홈 돌아가기")
                        .foregroundStyle(.white)
                        .frame(minHeight: 50)
                        .frame(width: UIScreen.main.bounds.width * 0.4)
                        .background(Color(hex: 0xD9D9D9))
                }
                NavigationLink(destination: DiseasePredictionSwiftUIView()) {
                    Text("질환 예측하기")
                        .foregroundStyle(.white)
                        .frame(minHeight: 50)
                        .frame(width: UIScreen.main.bounds.width * 0.6)
                        .background(Color("AccentColor"))
                }
            } // HStack
        } // VStack
        .background(Color(hex: 0x252525))
    }
    
    // Result Row
    func resultRow(text: String) -> some View {
        Text("\(text)")
            .font(.system(size: 15))
            .foregroundStyle(.white)
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .background(Color(hex: 0x0E0E0E, alpha: 0.5))
            .cornerRadius(26)
    }
}

#Preview {
    painRecordResultSwiftUIView()
}
