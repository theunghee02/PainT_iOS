//
//  Top2DiseasePredictionSwiftUIView.swift
//  PainT
//
//  Created by 최승희 on 8/6/24.
//

import SwiftUI

struct Top2DiseasePredictionSwiftUIView: View {
    // tab의 tag
    @State private var selectedTab = 1
    
    // api 로딩 상태를 관리
    @State var isLoading: Bool = true
    
    // api에서 불러온 데이터
    // 질환 정보 배열
    @State var predictions: [(predicted: String?, subject: String?, description: String?)] = [("","",""),("","","")]
    @State var username: String = ""
    
    @State var selectedDisease: Int = 0
    
    var body: some View {
        VStack(spacing: 0) {
            VStack {
                Text("자신의 증상과 가장 부합하는\n질환을 클릭해주세요")
                    .fontWeight(.semibold)
                    .font(.system(size: 28))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 10)
                Text("\(username) 님의 통증 기반 질환 예측 결과입니다")
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
                        if isLoading {
                            ProgressView("질환 예측 중")
                                .progressViewStyle(CircularProgressViewStyle())
//                                .scaleEffect(1)
                                .padding(.top, 100)
                        } else {
                            VStack(spacing: 0) {
                                ForEach(0..<predictions.count, id: \.self) { idx in
                                    diseaseRow(
                                        idx: idx,
                                        predicted: predictions[idx].predicted!,
                                        subject: predictions[idx].subject!,
                                        discription: predictions[idx].description!
                                    )
                                }
                            } // VStack
                        } // else
                        
                    } // VStack
                    .padding(.horizontal, 30.0)
                } // ZStack
            } // GeometryReader
            
            // 하단 버튼
            diseaseToHomeBtnView()
        } // VStack
        .onAppear() {
            // post 메소드 호출하는 함수 호출
            postDiseasePrediction()
        }
    } // body
        
    
    // 하단 버튼(홈으로 가기 위한 커스텀마이징)
    struct diseaseToHomeBtnView: View {
        @Environment(\.presentationMode) var presentationMode
        @EnvironmentObject var tabSelection: TabSelection
        
        var body: some View {
            VStack {
                HStack(spacing: 0) {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("이전")
                            .foregroundColor(Color(hex:0x252525))
                            .frame(minHeight: 50)
                            .frame(width: UIScreen.main.bounds.width * 0.4)
                            .background(Color(hex: 0xD9D9D9))
                    }
                    Button(action: {
                        // 다음 탭으로 이동
                        self.tabSelection.selectedTab = 0
                    }) {
                        Text("치유하러 가기")
                            .foregroundColor(Color(hex:0x252525))
                            .frame(minHeight: 50)
                            .frame(width: UIScreen.main.bounds.width * 0.6)
                            .background(Color("AccentColor"))
                    }
                }
            } // VStack
        }
    }
    
    
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
        
    } // diseaseRow()
    
    // 질환 예측 post api
    func postDiseasePrediction(){
        let authService = AuthService(apiPath: "/api/v1/ai/predict")
        authService.postRequest(resultType: Disease2Result.self) { response in
            print("----------------")
            print(response)
            switch response {
            case .success(let data):
                DispatchQueue.main.async {
                    print("POST 요청 성공: \(response)")
                    self.predictions[0] = (data.result?.predicted_1, data.result?.where_2_go_1, data.result?.description1)
                    self.predictions[1] = (data.result?.predicted_2, data.result?.where_2_go_2, data.result?.description2)
                    self.username = data.result!.username
                    print(data.result!)
                    
                    self.isLoading = false // 로딩 상태 false
                }
                
            case .failure(let error):
                DispatchQueue.main.async {
                    print("POST 요청 실패: \(error.localizedDescription)")
                    self.isLoading = false
                }
            }
        }
    } // postDiseasePrediction()
}
