//
//  bottomButtonSwiftUIView.swift
//  PainT
//
//  Created by 최승희 on 5/5/24.
//

import SwiftUI

struct bottomButtonSwiftUIView: View {
    @Environment(\.presentationMode) var presentationMode // 현재 Modal View
    let nextDestination: AnyView
    
    var body: some View {
        HStack(spacing: 0) {
            Button(action: {
                // 네비게이션 스택에서 이전 뷰로 이동 == Modal View 닫기
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("이전")
                    .foregroundColor(.white)
                    .frame(minHeight: 50)
                    .frame(width: UIScreen.main.bounds.width * 0.4)
                    .background(Color(red: 0xD9 / 255, green: 0xD9 / 255, blue: 0xD9 / 255))
            }
            NavigationLink(destination: nextDestination) {
                Text("다음")
                    .foregroundColor(.white)
                    .frame(minHeight: 50)
                    .frame(width: UIScreen.main.bounds.width * 0.6)
                    .background(Color("AccentColor"))
            }
        } // HStack
    }
}
