//
//  painRecordUnitySwiftUIView.swift
//  PainT
//
//  Created by 최승희 on 4/30/24.
//

import SwiftUI

struct painRecordUnitySwiftUIView: View {
    var body: some View {
        Text("painRecordUnitySwiftUIView")
        Spacer()
        NavigationLink(destination: painRecordInfoTriggerSwiftUIView()) {
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
