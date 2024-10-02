//
//  painRecordUnitySwiftUIView.swift
//  PainT
//
//  Created by 최승희 on 4/30/24.
//
//  3D 신체 페이지

import SwiftUI

struct painRecordUnitySwiftUIView: View {
    @State var locations: String = ""
    @State var locationName: String = ""
    @FocusState private var isTextFieldFocused: Bool
    
    var body: some View {
        VStack {
            Text("어느 부위에 통증이 발생했나요?")
                .fontWeight(.semibold)
                .font(.system(size:20))
            TextField("직접 입력해주세요", text: $locationName
//                      , onCommit: {
//                if !locationName.isEmpty {
//                    locations.append(locationName)
//                }
//            }
            )
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
//            Text("통증 부위를 입력한 후, Enter를 눌러주세요")
//                .padding(.top, 10)
//                .foregroundStyle(Color(hex: 0x252525))
            
            Spacer()
            
            // 하단 버튼
            bottomButtonSwiftUIView(nextDestination: AnyView(painRecordInfoTriggerSwiftUIView(location: locationName)))
        } // VStack
        .onAppear {
            isTextFieldFocused = true // 뷰가 나타나면 텍스트 필드에 포커스를 설정합니다.
        }
    } // body
} // painRecordUnitySwiftUIView
