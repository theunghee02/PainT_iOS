//
//  bottomButtonSwiftUIView.swift
//  PainT
//
//  Created by 최승희 on 5/5/24.
//

import SwiftUI

struct bottomButtonSwiftUIView: View {
    // 현재 Modal View
    @Environment(\.presentationMode) var presentationMode
    
    // 다음 화면
    let nextDestination: AnyView
    
    var body: some View {
        HStack(spacing: 0) {
            Button(action: {
                // 네비게이션 스택에서 이전 뷰로 이동
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("이전")
                    .foregroundColor(Color(hex:0x252525))
                    .frame(minHeight: 50)
                    .frame(width: UIScreen.main.bounds.width * 0.4)
                    .background(Color(hex: 0xD9D9D9))
            }
            NavigationLink(destination: nextDestination) {
                Text("다음")
                    .foregroundColor(Color(hex:0x252525))
                    .frame(minHeight: 50)
                    .frame(width: UIScreen.main.bounds.width * 0.6)
                    .background(Color("AccentColor"))
            }
        } // HStack
    }
}
