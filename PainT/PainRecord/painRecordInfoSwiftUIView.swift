//
//  painRecordInfoSwiftUIView.swift
//  PainT
//
//  Created by 최승희 on 4/30/24.
//

import SwiftUI

struct painRecordInfoTriggerSwiftUIView: View {
    @State var location: [String]
    @State var trigger: String = ""
    @FocusState private var isTextFieldFocused: Bool
    
    var body: some View {
        Text("어떤 경우에 통증이 발생했나요?")
            .fontWeight(.semibold)
            .font(.system(size:20))
        TextField("직접 입력해주세요", text: $trigger)
            .focused($isTextFieldFocused)
            .padding(20)
            .frame(maxWidth: UIScreen.main.bounds.width * 0.8)
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(Color.black, lineWidth: 1)
                    .frame(height: 1)
                    .padding(.top, 40) // 텍스트필드의 위쪽 패딩과 겹치지 않도록 조정
                    .padding(.bottom, -10) // 텍스트필드의 아래쪽 패딩과 겹치지 않도록 조정
            )
        
        Spacer()
        bottomButtonSwiftUIView(nextDestination: AnyView(painRecordInfoFeelingSwiftUIView(location:location,trigger:trigger)))
            .onAppear {
                isTextFieldFocused = true // 뷰가 나타나면 텍스트 필드에 포커스를 설정합니다.
            }
    }
}
