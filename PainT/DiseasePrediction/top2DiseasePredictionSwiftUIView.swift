//
//  Top2DiseasePredictionSwiftUIView.swift
//  PainT
//
//  Created by 최승희 on 8/6/24.
//

import SwiftUI

struct Top2DiseasePredictionSwiftUIView: View {
    // 질환명
    @State var predicted_1 : String = "슬개골탈구"
    @State var subject_1 : String = "신경외과, 정형외과"
    @State var discription_1 : String = "슬개골탈구는 무릎뼈(슬개골)가 정상 위치에서 벗어나 탈구되는 상태로, 주로 소형견에서 흔히 발생하며, 통증과 운동 제한을 초래할 수 있습니다."
    @State var predicted_2 : String = "슬개골탈구"
    @State var subject_2 : String = "정형외과"
    @State var discription_2 : String = "슬개골탈구는 무릎뼈(슬개골)가 정상 위치에서 벗어나 탈구되는 상태로, 주로 소형견에서 흔히 발생하며, 통증과 운동 제한을 초래할 수 있습니다."
    
    var body: some View {
        VStack(spacing: 0) {
//            ScrollView {
            VStack {
                Text("자신의 증상과 가장 부합하는\n질환을 클릭해주세요")
                    .fontWeight(.semibold)
                    .font(.system(size: 28))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 10)
                Text("통증 기반 질환 예측 결과입니다")
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 20)
                    .foregroundStyle(Color(hex: 0x414141))
            } // VStack
                
                // 질환 리스트 박스
            GeometryReader { geometry in
                ZStack(alignment: .top) {
                    // 배경 사각형
                    Rectangle()
                        .fill(Color(hex: 0xEBE9EE))
                        .clipShape(RoundedCorner(radius: 25, corners: [.topLeft, .topRight]))
                        .frame(height: geometry.size.height)
                    
                    // contents
                    VStack {
                        Text("정확한 진단은 반드시 의료기관에서 진료 받으시기 바랍니다")
                            .multilineTextAlignment(.center)
                            .padding(.top, 30)
                            .padding(.bottom, 20)
                            .frame(maxWidth: 250)
                        
                        // 질환1
                        VStack(spacing: 0) {
                            // 질환명 + 진료과
                            HStack(alignment: .center) {
                                Text("\(predicted_1)")
                                    .fontWeight(.semibold)
                                    .font(.system(size: 24))
                                Spacer()
                                Text("\(subject_1)")
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color("AccentColor"))
                            } // HStack
                            .padding(.horizontal, 30)
                            .padding(.top, 20)
                            .padding(.bottom, 10)
                            
                            // 설명
                            HStack(spacing: 0) {
                                Text("\(discription_1)")
                                    .font(.system(size: 15))
                                    .padding(.trailing, 15)
                            } // HStack
                            .padding(.leading, 30)
                            .padding(.bottom, 20)
                        } // VStack - 질환1
                        .background(Color(.white))
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                        .padding(.bottom, 30)
                        
                        // 질환2
                        VStack(spacing: 0) {
                            // 질환명 + 진료과
                            HStack(alignment: .center) {
                                Text("\(predicted_2)")
                                    .fontWeight(.semibold)
                                    .font(.system(size: 24))
                                Spacer()
                                Text("\(subject_2)")
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color("AccentColor"))
                            } // HStack
                            .padding(.horizontal, 30)
                            .padding(.top, 20)
                            .padding(.bottom, 10)
                            
                            // 설명
                            HStack(spacing: 0) {
                                Text("\(discription_2)")
                                    .font(.system(size: 15))
                                    .padding(.trailing, 15)
                            } // HStack
                            .padding(.leading, 30)
                            .padding(.bottom, 20)
                        } // VStack - 질환2
                        .background(Color(.white))
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                        .padding(.bottom, 30)
                    } // VStack
                    .padding(.horizontal, 30.0)
                } // ZStack
            } // GeometryReader
//            } // ScrollView
            
//            Spacer()
            
            // 하단 버튼
            bottomButtonSwiftUIView(nextDestination: AnyView(tabSwiftUIView()))
        } // VStack
    }
}

#Preview {
    Top2DiseasePredictionSwiftUIView()
}
