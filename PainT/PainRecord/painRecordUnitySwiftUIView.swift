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
            Button(action: {
                Unity.shared.show()
            }) {
                Text("Launch Unity")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
//            Text("Unity will launch soon...")
//                .onAppear() {
//                    Unity.shared.show()
//                }
            Spacer()
            NavigationLink(destination: painRecordInfoTriggerSwiftUIView(location: location)) {
                Text("다음")
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .background(Color("AccentColor"))
                    .foregroundColor(.white)
            } // NavigationLink
            .navigationTitle("통증 기록")
        } // VStack
    }
}

#Preview {
    painRecordUnitySwiftUIView()
}
