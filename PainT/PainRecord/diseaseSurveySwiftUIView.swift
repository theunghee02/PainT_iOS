//
//  DiseaseSurveySwiftUIView.swift
//  PainT
//
//  Created by 최승희 on 8/7/24.
//

import SwiftUI

struct DiseaseSurveySwiftUIView: View {
    @State var disease : String = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // title
                Text("어떤 통증을 완화하고 싶으신가요?")
                    .fontWeight(.semibold)
                    .font(.system(size: 26))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 10)
                    .padding(.top, 50)
                Text("질환에 따른 맞춤 가이드를 제공해 드릴게요!")
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 20)
                    .foregroundStyle(Color(hex: 0x414141))
                
                Spacer()
                
//                // 질환명 입력
//                VStack(alignment: .leading) {
//                    // 설명
//                    Text("질환명 입력")
//                        .fontWeight(.semibold)
//                        .font(.system(size: 24))
//                        .padding([.top, .leading, .trailing], 30.0)
//                        .padding(.bottom, 10)
//                    Text("병원에서 통증 관련 진단을 받은 적 있어요")
//                        .foregroundStyle(Color(hex: 0x414141))
//                        .padding(.horizontal, 30.0)
//                        .padding(.bottom, 10)
//                    
//                    // textfield
//                    TextField("질환명을 직접 입력해주세요", text: $disease)
//                        .padding([.bottom, .leading, .trailing], 30.0)
//                        .padding(.top, 10)
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 4)
//                                .stroke(Color.black, lineWidth: 1)
//                                .frame(height: 1)
//                                .padding(.top, 30)
//                                .frame(maxWidth: UIScreen.main.bounds.width * 0.7)
//                        )
//                } // VStack
//                .background(Color(hex: 0xF0F0F0))
//                .clipShape(RoundedRectangle(cornerRadius: 25))
//                .padding(.bottom, 40)
//                .padding(.horizontal, 40)
                
                // 통증 체크하러 가기
                NavigationLink(destination: painRecordUnitySwiftUIView()) {
                    VStack(alignment: .leading) {
                        // 설명
                        Text("통증 체크하러 가기")
                            .foregroundStyle(Color(.black))
                            .fontWeight(.semibold)
                            .font(.system(size: 24))
                            .padding(.bottom, 10)
                            .padding([.top, .leading, .trailing], 30)
                        Text("현재 통증을 기록하고, 어떤 질환 가능성을 갖는지 알아보고 싶어요")
                            .foregroundStyle(Color(hex: 0x414141))
                            .padding(30)
                    } // VStack
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color(hex: 0xF0F0F0))
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    .padding([.bottom, .horizontal], 40)
                }
                
                // 다음 버튼
//                NavigationLink(destination: painRecordUnitySwiftUIView()) {
//                    Text("다음")
//                        .frame(maxWidth: .infinity, minHeight: 50)
//                        .background(Color("AccentColor"))
//                        .foregroundColor(Color(hex:0x252525))
//                } // NavigationLink
            } // VStack
        } // NavigationStack
        .toolbar(.visible, for: .navigationBar)
    }
}

#Preview {
    DiseaseSurveySwiftUIView()
}
