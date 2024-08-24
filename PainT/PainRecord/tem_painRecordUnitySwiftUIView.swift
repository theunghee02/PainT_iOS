//
//  tem_painRecordUnitySwiftUIView.swift
//  PainT
//
//  Created by 최승희 on 8/24/24.
//

import SwiftUI

struct tem_painRecordUnitySwiftUIView: View {
    var body: some View {
        Button(action: {
                    Unity.shared.show()
                }) {
                    Text("Launch Unity!")
                }
//        VStack {
//            
//        }
//        .onAppear() {
//            Unity.shared.show()
//        }
    }
}

#Preview {
    tem_painRecordUnitySwiftUIView()
}
