//
//  painRecordInfoFeelingSwiftUIView.swift
//  PainT
//
//  Created by 최승희 on 4/30/24.
//

import SwiftUI

struct painRecordInfoFeelingSwiftUIView: View {
    var body: some View {
        Text("통증의 느낌은 어떠한가요?")
            .fontWeight(.semibold)
            .font(.system(size:20))
        List {
            feelingRow(feeling: "날카로운 느낌")
            feelingRow(feeling: "누르는 듯한 느낌")
            feelingRow(feeling: "칼로 벤 것처럼 아픔")
            feelingRow(feeling: "둔한 느낌")
            feelingRow(feeling: "타는 듯한 느낌")
            feelingRow(feeling: "쑤시는 느낌")
            feelingRow(feeling: "저린 느낌")
            feelingRow(feeling: "다른 부위로 퍼지듯 아픔")
            feelingRow(feeling: "아팠다 안 아팠다 함")
            feelingRow(feeling: "죄는 듯한 느낌")
        }
        HStack {
            Text("이전")
                .padding(.top, 20)
                .padding(.horizontal, 70)
                .background(Color(red: 0xD9 / 255, green: 0xD9 / 255, blue: 0xD9 / 255))
//            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            Text("다음")
                .padding(.top, 20)
                .padding(.horizontal, 90)
                .background(Color("AccentColor"))
        } // HStack
    }
}

// Feeling Row
struct feelingRow: View {
    var feeling: String
    var body: some View {
        Text("\(feeling)")
            .padding(10)
            .background(Color(red: 0xD9 / 255, green: 0xD9 / 255, blue: 0xD9 / 255))
            .cornerRadius(30)
    }
}

#Preview {
    painRecordInfoFeelingSwiftUIView()
}
