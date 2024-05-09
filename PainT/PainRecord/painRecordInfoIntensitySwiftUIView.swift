//
//  painRecordInfoIntensitySwiftUIView.swift
//  PainT
//
//  Created by 최승희 on 4/30/24.
//

import SwiftUI

struct painRecordInfoIntensitySwiftUIView: View {
    
    @State private var selectedIntensity: Int?
    
    let intensityTextList = [
        "통증 없음",
        "",
        "가벼운 통증",
        "",
        "보통 통증",
        "",
        "심한 통증",
        "",
        "매우 심한 통증",
        "",
        "최악의 통증"
    ]
    
    var body: some View {
        Text("통증의 강도는 어느 정도인가요?")
            .fontWeight(.semibold)
            .font(.system(size:20))
            .padding(20)
        HStack(spacing: 20) {
            ForEach((0...10).filter { $0 % 2 == 0 }, id: \.self) { idx in
                intensityRow(idx: idx, intensityText: intensityTextList[idx])
            }
        } // HStack
        Spacer()
        bottomButtonSwiftUIView(nextDestination: AnyView(painRecordResultSwiftUIView()))
    }
    
    func intensityRow(idx: Int, intensityText: String) -> some View {
        VStack(spacing: 20) {
            Text("\(idx)")
                .background(
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundColor(selectedIntensity == idx ? Color("AccentColor") : Color.gray)
                )
                .foregroundColor(.black)
                
            Text("\(intensityText)")
                .font(.system(size:9))
                .foregroundColor(selectedIntensity == idx ? Color("AccentColor") : Color.gray)
        } // VStack
        .onTapGesture {
            self.selectedIntensity = idx
        }
    }
}

#Preview {
    painRecordInfoIntensitySwiftUIView()
}
