//
//  DiseaseSurveySwiftUIView.swift
//  PainT
//
//  Created by 최승희 on 8/7/24.
//

import SwiftUI

struct DiseaseSurveySwiftUIView: View {
    @State var disease : String = "허리디스크"
    
    var body: some View {
        VStack(spacing: 0) {
            // title
            Text("어떤 통증을 완화하고 싶으신가요?")
                .fontWeight(.semibold)
                .font(.system(size: 28))
                .multilineTextAlignment(.center)
                .padding(.bottom, 10)
            Text("질환에 따른 맞춤 가이드를 제공해 드릴게요!")
                .multilineTextAlignment(.center)
                .padding(.bottom, 20)
                .foregroundStyle(Color(hex: 0x414141))
            
            Spacer()
            
            // 질환명 입력
            VStack(alignment: .leading) {
                // 설명
                Text("질환명 입력")
                    .fontWeight(.semibold)
                    .font(.system(size: 24))
                    .padding([.top, .leading, .trailing], 20.0)
                    .padding(.bottom, 10)
                Text("병원에서 통증 관련 진단을 받은 적 있어요")
                    .foregroundStyle(Color(hex: 0x414141))
                    .padding(.horizontal, 20.0)
                    .padding(.bottom, 10)
                
                // textfield
                TextField("질환명을 직접 입력해주세요", text: $disease)
                    .padding(.vertical, 30)
                    .padding(.horizontal, 20)
            } // VStack
            .background(Color(hex: 0xF0F0F0))
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .padding(.bottom, 40)
            .padding(.horizontal, 30)
            
            // 통증 체크하러 가기
            VStack(alignment: .leading) {
                // 설명
                Text("통증 체크하러 가기")
                    .fontWeight(.semibold)
                    .font(.system(size: 24))
                    .padding(.horizontal, 20.0)
                    .padding(.bottom, 10)
                    .padding(.top, 30)
                Text("현재 통증을 기록하여,\n어떤 질환 가능성을 갖는지 알아보고 싶어요")
                    .foregroundStyle(Color(hex: 0x414141))
                    .padding(.vertical, 30)
                    .padding(.horizontal, 20)
            } // VStack
            .background(Color(hex: 0xF0F0F0))
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .padding(.bottom, 40)
            .padding(.horizontal, 30)
            
            // 다음 버튼
            NavigationLink(destination: homeSwiftUIView()) {
                Text("다음")
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .background(Color("AccentColor"))
                    .foregroundColor(Color(hex:0x252525))
            } // NavigationLink
        } // VStack
    }
}

#Preview {
    DiseaseSurveySwiftUIView()
}
