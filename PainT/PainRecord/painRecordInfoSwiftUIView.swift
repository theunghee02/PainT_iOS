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
        bottomButtonSwiftUIView(nextDestination: AnyView(painRecordInfoTimeSwiftUIView()))
    }
}

#Preview {
    painRecordInfoTriggerSwiftUIView()
}
