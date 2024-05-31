//
//  LodingStyle.swift
//  PainT
//
//  Created by Shin Yeong Gwak on 5/29/24.
//  출처 https://growingsaja.tistory.com/832

import SwiftUI

struct LoadingView: View {
    @State private var isLoading = false
    var body: some View {
        ZStack {
            // 로딩 바를 나타낼 배경
            Color.gray.opacity(0.0)
                .ignoresSafeArea()
                .opacity(isLoading ? 1 : 0) // 로딩 중에만 보이도록 설정

            // 로딩 바
            ZStack {
                Rectangle()
                    .foregroundColor(Color.white)
                    .frame(height: 200)
                VStack {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle()) // 로딩 바 스타일 설정
                        .scaleEffect(2) // 크기 조절
                        .padding(.top, 60)
                        .opacity(isLoading ? 1 : 0) // 로딩 중에만 보이도록 설정

                }
            }
            
        }
        .onAppear {
            startLoading() // 뷰가 나타날 때 로딩 시작
        }
    }

    func startLoading() {
        isLoading = true
        // 로딩이 완료된 후에 isLoading을 false로 설정하여 로딩 바를 숨김
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            isLoading = false
        }
    }
}


#Preview {
    LoadingView()
}
