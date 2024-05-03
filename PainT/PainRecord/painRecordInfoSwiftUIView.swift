//
//  painRecordInfoSwiftUIView.swift
//  PainT
//
//  Created by 최승희 on 4/30/24.
//

import SwiftUI

struct painRecordInfoTriggerSwiftUIView: View {
    @State var trigger: String = ""
    
    var body: some View {
        Text("어떤 경우에 통증이 발생했나요?")
            .fontWeight(.semibold)
            .font(.system(size:20))
        TextField("직접 입력해주세요", text: $trigger)
            .padding(20)
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
        Spacer()
        HStack(spacing: 0) {
                NavigationLink(destination: painRecordUnitySwiftUIView()) {
                    Text("이전")
                        .foregroundColor(.white)
                        .frame(minHeight: 50)
                        .frame(width: UIScreen.main.bounds.width * 0.4)
                        .background(Color(red: 0xD9 / 255, green: 0xD9 / 255, blue: 0xD9 / 255))
                }
                NavigationLink(destination: painRecordInfoFeelingSwiftUIView()) {
                    Text("다음")
                        .foregroundColor(.white)
                        .frame(minHeight: 50)
                        .frame(width: UIScreen.main.bounds.width * 0.6)
                        .background(Color("AccentColor"))
                }
        } // HStack
    }
}

#Preview {
    painRecordInfoTriggerSwiftUIView()
}
