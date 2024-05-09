//
//  painRecordInfoFeelingSwiftUIView.swift
//  PainT
//
//  Created by 최승희 on 4/30/24.
//
//  통증 느낌 페이지

import SwiftUI

struct painRecordInfoFeelingSwiftUIView: View {
    // 선택한 느낌
    @State private var selectedFeelings: Set<String> = []
    
    // 통증 느낌
    let feelings = ["날카로운 느낌",
                       "누르는 듯한 느낌",
                       "칼로 벤 것처럼 아픔",
                       "둔한 느낌",
                       "타는 듯한 느낌",
                       "쑤시는 느낌",
                       "저린 느낌",
                       "다른 부위로 퍼지듯 아픔",
                       "아팠다 안 아팠다 함",
                       "죄는 듯한 느낌"]
    
    var body: some View {
        // Title
        Text("통증의 느낌은 어떠한가요?")
            .fontWeight(.semibold)
            .font(.system(size:20))
            .padding(.bottom, 30)
        
        // 통증 느낌
        VStack(alignment: .leading, spacing: 20) {
            ForEach(0..<feelings.count, id: \.self) { idx in
                if idx % 2 == 0 {
                    HStack(spacing: 20) {
                        feelingRow(feeling: feelings[idx])
                        if idx + 1 < feelings.count {
                            feelingRow(feeling: feelings[idx + 1])
                        }
                    }
                }
            }
        } // VStack
        
        Spacer()
        
        // 하단 버튼
        bottomButtonSwiftUIView(nextDestination: AnyView(painRecordInfoIntensitySwiftUIView()))
    }
    
    // Feeling Row
    func feelingRow(feeling: String) -> some View {
        // 선택 여부
        let isSelected = selectedFeelings.contains(feeling)
        
        return Text("\(feeling)")
            .font(.system(size: 17))
            .foregroundColor(isSelected ? .white : Color(hex: 0x999999))
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .background(isSelected ? Color("AccentColor") : Color(hex: 0xF0F0F0))
            .cornerRadius(30)
            .onTapGesture {
                if isSelected {
                    selectedFeelings.remove(feeling)
                } else {
                    selectedFeelings.insert(feeling)
                }
            }
    }
}

#Preview {
    painRecordInfoFeelingSwiftUIView()
}
