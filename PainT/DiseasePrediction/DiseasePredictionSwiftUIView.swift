//
//  DiseasePredictionSwiftUIView.swift
//  PainT
//
//  Created by 최승희 on 4/30/24.
//

import SwiftUI

struct DiseasePredictionSwiftUIView: View {
    var username: String = "수정"
    var diseases: [String] = ["척추 추간판 탈출증", "척추관 협착증", "요추 추간판 탈출증", "허리 굽힘증", "허리 디스크"]
    
    var body: some View {
        Text("예측 질환 Top 5")
            .fontWeight(.semibold)
            .font(.system(size:20))
            .padding(.bottom, 35)
        Text("\(username)님의 최근 통증 기록을 기반으로 예측한 질환입니다.")
        List {
            Section(header: Text("Top 1")) {
                Text("\(diseases[0])")
            }
            Section(header: Text("Top 2")) {
                Text("\(diseases[1])")
            }
            Section(header: Text("Top 3")) {
                Text("\(diseases[2])")
            }
            Section(header: Text("Top 4")) {
                Text("\(diseases[3])")
            }
            Section(header: Text("Top 5")) {
                Text("\(diseases[4])")
            }
        } // List
        .listStyle(.inset)
    }
}

#Preview {
    DiseasePredictionSwiftUIView()
}
