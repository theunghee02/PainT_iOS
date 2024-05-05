//
//  painRecordResultSwiftUIView.swift
//  PainT
//
//  Created by 최승희 on 5/5/24.
//

import SwiftUI

struct painRecordResultSwiftUIView: View {
    var body: some View {
        Spacer()
        HStack(spacing: 0) {
            NavigationLink(destination: tabSwiftUIView().navigationBarBackButtonHidden()) {
                Text("홈 돌아가기")
                    .foregroundColor(.white)
                    .frame(minHeight: 50)
                    .frame(width: UIScreen.main.bounds.width * 0.4)
                    .background(Color(red: 0xD9 / 255, green: 0xD9 / 255, blue: 0xD9 / 255))
            }
            NavigationLink(destination: DiseasePredictionSwiftUIView()) {
                Text("질환 예측하기")
                    .foregroundColor(.white)
                    .frame(minHeight: 50)
                    .frame(width: UIScreen.main.bounds.width * 0.6)
                    .background(Color("AccentColor"))
            }
        } // HStack
    }
}

#Preview {
    painRecordResultSwiftUIView()
}
