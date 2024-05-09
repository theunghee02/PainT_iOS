//
//  painRecordInfoFeelingSwiftUIView.swift
//  PainT
//
//  Created by 최승희 on 4/30/24.
//

import SwiftUI

struct painRecordInfoFeelingSwiftUIView: View {
    let feelingList = ["날카로운 느낌","누르는 듯한 느낌","칼로 벤 것처럼 아픔","둔한 느낌","타는 듯한 느낌","쑤시는 느낌","저린 느낌","다른 부위로 퍼지듯 아픔","아팠다 안 아팠다 함","죄는 듯한 느낌"]
    
    var body: some View {
        Text("통증의 느낌은 어떠한가요?")
            .fontWeight(.semibold)
            .font(.system(size:20))
            .padding(.bottom, 30)
        VStack(spacing: 20) {
            ForEach(0..<feelingList.count, id: \.self) { idx in
                if idx % 2 == 0 {
                    HStack(spacing: 20) {
                        feelingRow(feeling: feelingList[idx])
                        if idx + 1 < feelingList.count {
                            feelingRow(feeling: feelingList[idx + 1])
                        }
                    }
                }
            }
        }
        Spacer()
        bottomButtonSwiftUIView(nextDestination: AnyView(painRecordInfoIntensitySwiftUIView()))
    }
}

// Feeling Row
struct feelingRow: View {
    var feeling: String
    var body: some View {
        Text("\(feeling)")
            .padding(10)
            .background(Color(red: 0xD9 / 255, green: 0xD9 / 255, blue: 0xD9 / 255))
            .cornerRadius(30)
    }
}

#Preview {
    painRecordInfoFeelingSwiftUIView()
}
