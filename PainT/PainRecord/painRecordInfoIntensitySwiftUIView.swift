//
//  painRecordInfoIntensitySwiftUIView.swift
//  PainT
//
//  Created by 최승희 on 4/30/24.
//
//  통증 강도 페이지

import SwiftUI

struct painRecordInfoIntensitySwiftUIView: View {
    // 선택한 Intensity
    @State private var selectedIntensity: Int?
    
    // Intensity dictionary
    let intensities = [0 : "통증 없음",
                       2 : "가벼운 통증",
                       4 : "보통 통증",
                       6 : "심한 통증",
                       8 : "매우 심한 통증",
                       10 : "최악의 통증"]
    
    var body: some View {
        // Title
        Text("통증의 강도는 어느 정도인가요?")
            .fontWeight(.semibold)
            .font(.system(size:20))
            .padding(20)
        
        // Intensity
        HStack(spacing: 0) {
            ForEach((0...10).filter { $0 % 2 == 0 }, id: \.self) { idx in
                if let intensityText = intensities[idx] {
                    intensityRow(idx: idx, intensityText: intensityText)
                }
            }
        } // HStack
        
        Spacer()
        
        // 하단 버튼
        bottomButtonSwiftUIView(nextDestination: AnyView(painRecordResultSwiftUIView()))
    }
    
    // Intensity 컴포넌트
    func intensityRow(idx: Int, intensityText: String) -> some View {
        VStack(spacing: 10) {
            // 원형 Intensity
            Text("\(idx)")
                .font(.system(size: 20))
                .frame(width: 51, height: 52)
                .foregroundColor(selectedIntensity == idx ? .white : Color(hex: 0x999999))
                .background(
                    Circle()
                        .foregroundColor(selectedIntensity == idx ? Color("AccentColor") : Color(hex: 0xF0F0F0))
                )
            
            // Intensity 설명
            Text("\(intensityText)")
                .font(.system(size: 10))
                .foregroundColor(selectedIntensity == idx ? Color("AccentColor") : Color(hex: 0x999999))
        } // VStack
        .frame(width: 58)
        .onTapGesture { // Intensity 클릭 시 idx 저장
            self.selectedIntensity = idx
        }
    }
}

#Preview {
    painRecordInfoIntensitySwiftUIView()
}
