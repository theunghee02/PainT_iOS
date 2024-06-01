//
//  painRecordUnitySwiftUIView.swift
//  PainT
//
//  Created by 최승희 on 4/30/24.
//
//  3D 신체 페이지

import SwiftUI

struct painRecordUnitySwiftUIView: View {
    //sy-gwak 이거 웹뷰로 할거면 지금 방식으론 힘들거고 WebDelegate로 웹뷰 결과값 받아와야할거야
    @State var location: [String] = ["척추 중간에서 살짝 아래 부분"]
    var body: some View {
        webview(urlToLoad: "https://www.naver.com")
        
        Spacer()
        NavigationLink(destination: painRecordInfoTriggerSwiftUIView(location: location)) {
            Text("다음")
                .frame(maxWidth: .infinity, minHeight: 50)
                .background(Color("AccentColor"))
                .foregroundColor(.white)
        } // NavigationLink
        .navigationTitle("통증 기록")
    }
}

#Preview {
    painRecordUnitySwiftUIView()
}
