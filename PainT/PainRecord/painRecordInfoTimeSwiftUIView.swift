//
//  painRecordInfoTimeSwiftUIView.swift
//  PainT
//
//  Created by 최승희 on 5/5/24.
//

import SwiftUI

struct painRecordInfoTimeSwiftUIView: View {
    
    @State private var selectedTime = Date()
    
    var body: some View {
        Text("통증 발생 시간은 어떻게 되나요?")
        DatePicker("시간 선택", selection: $selectedTime, in: ...Date(), displayedComponents: .hourAndMinute)
            .datePickerStyle(CompactDatePickerStyle())
            .labelsHidden()
        Spacer()
        bottomButtonSwiftUIView(nextDestination: AnyView(painRecordInfoFeelingSwiftUIView()))
    }
}

#Preview {
    painRecordInfoTimeSwiftUIView()
}
