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
        TextField("직접 입력해주세요", text: $trigger)
            .padding(20)
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
        HStack {
            Text("이전")
                .padding(.vertical, 20)
                .padding(.horizontal, 60)
                .background(Color(red: 0xD9 / 255, green: 0xD9 / 255, blue: 0xD9 / 255))
//            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            Text("다음")
                .padding(.vertical, 20)
                .padding(.horizontal, 80)
                .background(Color("AccentColor"))
        } // HStack
    }
}

#Preview {
    painRecordInfoTriggerSwiftUIView()
}
