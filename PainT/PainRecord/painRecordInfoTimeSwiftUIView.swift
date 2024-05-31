//
//  painRecordInfoTimeSwiftUIView.swift
//  PainT
//
//  Created by 최승희 on 5/5/24.
//

import SwiftUI

struct painRecordInfoTimeSwiftUIView: View {
    @State var location: String
    @State var trigger: String
    
    @State var selectedTime = Date()
    
    var body: some View {
        Text("통증 발생 시간은 어떻게 되나요?")
            .fontWeight(.semibold)
            .font(.system(size:20))
        DatePicker("시간 선택", selection: $selectedTime, in: ...Date(), displayedComponents: .hourAndMinute)
            .datePickerStyle(CompactDatePickerStyle())
            .labelsHidden()
        Spacer()
        bottomButtonSwiftUIView(nextDestination: AnyView(painRecordInfoFeelingSwiftUIView(location:location,trigger:trigger, selectedTime:selectedTime)))
    }
}
