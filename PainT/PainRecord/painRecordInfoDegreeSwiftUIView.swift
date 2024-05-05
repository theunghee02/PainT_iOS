//
//  painRecordInfoDegreeSwiftUIView.swift
//  PainT
//
//  Created by 최승희 on 4/30/24.
//

import SwiftUI

struct painRecordInfoDegreeSwiftUIView: View {
    
    @State private var selectedDegree: Int?
    
    let degreeTextList = [
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
            .padding(20)
        HStack(spacing: 20) {
            ForEach((0...10).filter { $0 % 2 == 0 }, id: \.self) { idx in
                degreeRow(idx: idx, degreeText: degreeTextList[idx])
            }
        } // HStack
        Spacer()
        bottomButtonSwiftUIView(nextDestination: AnyView(painRecordResultSwiftUIView()))
    }
    
    func degreeRow(idx: Int, degreeText: String) -> some View {
        VStack(spacing: 20) {
            Text("\(idx)")
                .background(
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundColor(selectedDegree == idx ? Color("AccentColor") : Color.gray)
                )
                .foregroundColor(.black)
                
            Text("\(degreeText)")
                .font(.system(size:12))
                .foregroundColor(selectedDegree == idx ? Color("AccentColor") : Color.gray)
        } // VStack
        .onTapGesture {
            self.selectedDegree = idx
        }
    }
}

#Preview {
    painRecordInfoDegreeSwiftUIView()
}
