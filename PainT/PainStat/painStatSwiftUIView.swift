//
//  painStatSwiftUIView.swift
//  PainT
//
//  Created by 최승희 on 4/29/24.
//

import SwiftUI

struct painStatSwiftUIView: View {
    var body: some View {
        ZStack {
            // 배경 색상 설정
            Color(hex: 0x252525)
                .edgesIgnoringSafeArea(.all)
            GeometryReader { geometry in
                Image("stat")
                    .resizable()
                    .scaledToFit() // 이미지가 프레임에 맞게 조정됩니다.
                    .frame(width: geometry.size.width, height: geometry.size.height*1.05)
                    .scaleEffect(1.15) // 스케일을 50%로 조정합니다.
            } // GeometryReader
        } // ZStack
    }
}

#Preview {
    painStatSwiftUIView()
}
