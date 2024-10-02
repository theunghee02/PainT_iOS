//
//  DiseasePredictionSwiftUIView.swift
//  PainT
//
//  Created by 최승희 on 4/30/24.
//

import SwiftUI

struct DiseasePredictionSwiftUIView: View {
    @State var username: String = "user123"
    @State var diseases: [String?] = ["","","","",""]
    
    var body: some View {
        VStack {
            Text("예측 질환 Top 5")
                .fontWeight(.semibold)
                .font(.system(size:20))
                .padding(.bottom, 30)
            Text("\(username)님의 최근 통증 기록을 기반으로 예측한 질환입니다.")
            List((0..<5), id: \.self) { idx in
                Section(header: Text("Top \(idx+1)")) {
                    NavigationLink(destination: webview(urlToLoad: "https://search.naver.com/search.naver?ie=UTF-8&sm=whl_hty&query=\(diseases[idx]!)")) {
                        Text("\(diseases[idx]!)")
                    } // NavigationLink
                } // Section
            } // List
        } // VStack
        .onAppear() {
            // post 메소드 호출하는 함수 호출
            postDisease()
        }
    } // body
    
    // 질환 예측 post api 연동
    func postDisease(){
        let authService = AuthService(apiPath: "/api/v1/ai/predict")
        authService.postRequest(resultType: DiseaseResult.self) { response in
            print("----------------")
            print(response)
            switch response {
            case .success(let data):
                print("POST 요청 성공: \(response)")
                self.diseases[0] = data.result?.predicted_1
                self.diseases[1] = data.result?.predicted_2
                self.diseases[2] = data.result?.predicted_3
                self.diseases[3] = data.result?.predicted_4
                self.diseases[4] = data.result?.predicted_5
                self.username = data.result!.username
                print(data.result!)
            case .failure(let error):
                print("POST 요청 실패: \(error.localizedDescription)")
            }
        }
    } // postDisease()
}

#Preview {
    DiseasePredictionSwiftUIView()
}
