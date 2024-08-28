//
//  Top2DiseasePredictionSwiftUIView.swift
//  PainT
//
//  Created by 최승희 on 8/6/24.
//

import SwiftUI

struct Top2DiseasePredictionSwiftUIView: View {
    // 질환 정보 배열
    let predictions: [(predicted: String, subject: String, description: String)] = [
        ("척추관 협착증", "신경외과, 정형외과", "척추관 협착증은 척추관이 좁아져 신경을 압박하는 질환으로, 허리 통증, 다리 저림, 근력 약화, 걷기 어려움 등의 증상을 유발합니다. 증상은 오래 앉아 있거나 걷는 동안 심해질 수 있습니다."),
        ("요추 염좌", "정형외과, 재활의학과", "요추 염좌는 일반적으로 갑작스러운 움직임, 중량 들기, 또는 부적절한 자세로 인해 발생하는 허리 근육과 인대의 손상을 말합니다. 이로 인해 허리 부위에 통증, 뻣뻣함, 움직임 제한 등의 증상이 나타날 수 있습니다. 치료는 통증 완화를 위한 안정, 냉찜질, 약물 복용, 그리고 물리치료 등을 포함할 수 있습니다.")
    ]
    
    @State var selectedDisease: Int = 0
    
    var body: some View {
        VStack(spacing: 0) {
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
                        
                        // 질환 2개
                        VStack(spacing: 0) {
                            ForEach(0..<predictions.count, id: \.self) { idx in
                                diseaseRow(
                                    idx: idx,
                                    predicted: predictions[idx].predicted,
                                    subject: predictions[idx].subject,
                                    discription: predictions[idx].description
                                )
                            }
                        } // VStack
                    } // VStack
                    .padding(.horizontal, 30.0)
                } // ZStack
            } // GeometryReader
            
            // 하단 버튼
            bottomButtonSwiftUIView(nextDestination: AnyView(tabSwiftUIView()))
        } // VStack
    } // body
    
    // 질환 정보 컴포넌트
    func diseaseRow(idx: Int, predicted: String, subject: String, discription: String) -> some View {
        VStack(spacing: 0) {
            // 질환명 + 진료과
            HStack(alignment: .center) {
                Text(predicted)
                    .fontWeight(.semibold)
                    .font(.system(size: 24))
                Spacer()
                Text(subject)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color("AccentColor"))
            } // HStack
            .padding(.horizontal, 30)
            .padding(.top, 20)
            .padding(.bottom, 10)
            
            // 설명
            HStack(spacing: 0) {
                Text(discription)
                    .font(.system(size: 15))
                    .padding(.trailing, 15)
            } // HStack
            .padding(.leading, 30)
            .padding(.bottom, 20)
        } // VStack
        .background(Color(.white))
        .clipShape(RoundedRectangle(cornerRadius: 25))
        .overlay(
            RoundedRectangle(cornerRadius: 25)
                .stroke(idx == selectedDisease ? Color(hex: 0x04DC88) : Color.clear, lineWidth: 2)
        )
        .padding(.bottom, 30)
        .onTapGesture { // Intensity 클릭 시 idx 저장
            self.selectedDisease = idx
        } // onTapGesture

    }
}

#Preview {
    Top2DiseasePredictionSwiftUIView()
}
