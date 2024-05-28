//
//  DiseasePredictionSwiftUIView.swift
//  PainT
//
//  Created by 최승희 on 4/30/24.
//

import SwiftUI

struct DiseasePredictionSwiftUIView: View {
    @StateObject private var networkManager = NetworkManager()
    @State var username: String = "user123"
    var diseases: [String] = ["척추 추간판 탈출증", "척추관 협착증", "요추 추간판 탈출증", "허리 굽힘증", "허리 디스크"]
    
    var body: some View {
        VStack {
            Text("예측 질환 Top 5")
                .fontWeight(.semibold)
                .font(.system(size:20))
                .padding(.bottom, 30)
            Text("\(username)님의 최근 통증 기록을 기반으로 예측한 질환입니다.")
            var idx: Int = 0
            List(networkManager.diseases, id: \.self) { disease in
    //            ForEach(0..<5) { idx in
                    Section(header: Text("Top \(idx+1)")) {
                        NavigationLink(destination: webview(urlToLoad: "https://search.naver.com/search.naver?ie=UTF-8&sm=whl_hty&query=\(disease)")) {
                            Text("\(disease)")
                        } // NavigationLink
                    } // Section
    //            } // ForEach
            } // List
        } // VStack
        .onAppear() {
            // get 메소드 호출하는 함수 호출
            postDisease()
        }
    }
}

func postDisease(){
    let authService = AuthService(apiPath: "/api/v1/ai/predict")
    authService.postRequest() { response in
        print("----------------")
        print(response)
        switch response {
        case .success(let data):
            print("POST 요청 성공: \(response)")
            print(data.result!)
        case .failure(let error):
            print("POST 요청 실패: \(error.localizedDescription)")
        }
    }
}

#Preview {
    DiseasePredictionSwiftUIView()
}
