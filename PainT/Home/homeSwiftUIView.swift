//
//  homeSwiftUIView.swift
//  PainT
//
//  Created by 최승희 on 4/29/24.
//

import SwiftUI

struct homeSwiftUIView: View {
    var body: some View {
        NavigationView {
            HStack {
                VStack {
                    Text("통증 기록")
                        .font(.system(size: 18))
                        .fontWeight(/*@START_MENU_TOKEN@*/.semibold/*@END_MENU_TOKEN@*/).padding(10)
                    Text("내 몸의 통증을\n기록해서 확인하기")
                        .font(.system(size: 14)).foregroundColor(Color(red: 0x6E / 255, green: 0x6E / 255, blue: 0x6E / 255))
                        .padding([.leading, .bottom, .trailing], 10.0)
                } // VStack
                .background(Color(red: 0xD9 / 255, green: 0xD9 / 255, blue: 0xD9 / 255))
                
                VStack {
                    Text("질환 예측")
                        .font(.system(size: 18))
                        .fontWeight(/*@START_MENU_TOKEN@*/.semibold/*@END_MENU_TOKEN@*/).padding(10)
                    Text("통증을 종합해서\n질환 예측해보기")
                        .font(.system(size: 14))
                        .foregroundColor(Color(red: 0x6E / 255, green: 0x6E / 255, blue: 0x6E / 255))
                        .padding([.leading, .bottom, .trailing], 10.0)
                } // VStack
                .background(Color(red: 0xD9 / 255, green: 0xD9 / 255, blue: 0xD9 / 255))
            } // HStack
        }
    }
}

#Preview {
    homeSwiftUIView()
}
