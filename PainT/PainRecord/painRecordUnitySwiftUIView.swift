//
//  painRecordUnitySwiftUIView.swift
//  PainT
//
//  Created by 최승희 on 4/30/24.
//
//  3D 신체 페이지

import SwiftUI

struct painRecordUnitySwiftUIView: View {
    @State var location: [String] = ["척추 중간에서 살짝 아래 부분"]
    var body: some View {
        VStack {
            // 유니티 연동 버튼
            UnityContainerView()
            Spacer(minLength: 0)
            NavigationLink(destination: painRecordInfoTriggerSwiftUIView(location: location)
                .onAppear {
//                    Unity.shared.unityDidUnload(<#Notification?#>)
//                    Unity.shared.unloadWindow()
                }) {
                Text("다음")
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .background(Color("AccentColor"))
                    .foregroundColor(.white)
            } // NavigationLink
            .navigationTitle("통증 기록")
        } // VStack
    }
}

struct UnityContainerView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UnityViewController {
        return UnityViewController()
    }

    func updateUIViewController(_ uiViewController: UnityViewController, context: Context) {
        // 업데이트할 내용이 있으면 추가
    }
}
