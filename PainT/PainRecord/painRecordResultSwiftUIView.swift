//
//  painRecordResultSwiftUIView.swift
//  PainT
//
//  Created by 최승희 on 5/5/24.
//

import SwiftUI

struct painRecordResultSwiftUIView: View {
    @Binding var location: [String]
    @Binding var trigger: String
    @Binding var selectedFeelings: [String]
    @Binding var selectedIntensity: Int
    
    var username: String = "수정"
    
    @State var intensityText : String
    
    var selectedTime: Date = Date()
    
    // 날짜를 원하는 형식의 문자열로 변환
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY\nMM.dd"
        return formatter
    }()
    // 시간 문자열 변환
    let timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        return formatter
    }()
    
    // sy-gwak
    let requestFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return formatter
    }() //
    
    var imageID : String = "665980dcf405aa78f07608e2" // 정상
//    var imageID : String = "665980dcf405aa78f076082" // 비정상
    
    var body: some View {
        VStack {
            Spacer()
            
            // 상위 문구
            Text("\(username)님의\n기록이 완성되었습니다")
                .multilineTextAlignment(.center)
                .foregroundStyle(.white)
                .font(.system(size: 24))
            
            // 기록 카드
            VStack {
                // 상위 항목
                HStack {
                    // 날짜 및 시간
                    VStack(alignment: .leading) {
                        // 텍스트로 오늘의 날짜 표시
                        Text(dateFormatter.string(from: selectedTime))
                            .foregroundStyle(.white)
                            .font(.system(size: 48))
                            .fontWeight(/*@START_MENU_TOKEN@*/.medium/*@END_MENU_TOKEN@*/)
                        Text(timeFormatter.string(from: selectedTime))
                            .foregroundStyle(.white)
                            .font(.system(size: 14))
                    }
                    .padding()
                    
                    // 강도 아이콘
                    VStack {
                        Image("pain\(selectedIntensity)")
                        Text("\(intensityText)")
                            .foregroundStyle(.white)
                    } // VStack
                    .padding(.horizontal, 10)
                    .padding(.vertical, 20.0)
                    .background(Color(hex: 0x0E0E0E, alpha: 0.5))
                    .cornerRadius(27)
                } // HStack
                .padding(20)
                
                // 하위 항목
                HStack {
                    // 3D 신체
                    AsyncImage(url: URL(string: "http://chi-iu.com/unity/images/\(imageID)"),
                               scale: 8) { phase in
                        if let image = phase.image {
                            image // 사진 띄우기
                        } else {
                            let image = Image("body-default")
                            image.resizable()
                        }
                    }
                        .frame(width: 150.0, height: 300.0)
                        .padding(.leading, 10)
                        .padding(.bottom, 15)
//                        .background(Color(.white))
                    
                    // 트리거 및 느낌
                    VStack(alignment: .trailing, spacing: 20) {
                        ForEach(0..<selectedFeelings.count+1, id: \.self) { idx in
                            if idx == 0 {
                                //오류나서 하드코딩함
                                Text(trigger)
                                    .font(.system(size: 15))
                                    .foregroundStyle(.white)
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 10)
                                    .background(Color(hex: 0x0E0E0E, alpha: 0.5))
                                    .cornerRadius(26)
                            }
                            else {
                                Text(selectedFeelings[idx-1])
                                    .font(.system(size: 15))
                                    .foregroundStyle(.white)
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 10)
                                    .background(Color(hex: 0x0E0E0E, alpha: 0.5))
                                    .cornerRadius(26)
                            }
                        }
                    }
                    .padding()
                }
            } // VStack
            .overlay(
                RoundedRectangle(cornerRadius: 60) // 원하는 cornerRadius 값으로 설정
                    .stroke(Color.black, lineWidth: 1) // 테두리 색상 및 두께 지정
            )
//            .background(Color(hex: 0x333333))
            
            Spacer()
            
            // 하단 버튼
            HStack(spacing: 0) {
                NavigationLink(destination: tabSwiftUIView().navigationBarBackButtonHidden()) {
                    Text("홈 돌아가기")
                        .foregroundStyle(.white)
                        .frame(minHeight: 50)
                        .frame(width: UIScreen.main.bounds.width * 0.4)
                        .background(Color(hex: 0xD9D9D9))
                }
                NavigationLink(destination: DiseasePredictionSwiftUIView()) {
                    Text("질환 예측하기")
                        .foregroundStyle(.white)
                        .frame(minHeight: 50)
                        .frame(width: UIScreen.main.bounds.width * 0.6)
                        .background(Color("AccentColor"))
                }
            } // HStack
        } // VStack
        .background(Color(hex: 0x252525))
        // sy-gwak
        .onAppear {
            
            let formatTime = requestFormatter.string(from: selectedTime)
            
            print("\(location)  | \(selectedIntensity) | \(trigger) | \(selectedFeelings) | \(formatTime) \n")
            let body = RequestRecord(location: self.location, intensity: self.selectedIntensity, trigger: self.trigger, type: self.selectedFeelings, painTimestamp: formatTime)
            
            let svc = AuthService(apiPath: "/api/v1/pain-records/post")
            svc.postRequest(resultType: String.self,parameters: body){
                result in
                    switch result {
                    case .success(let value):
                        if(value.code == 2000) {
                        }
                        else {
                            alertMsg = value.message
                            showAlert = true
                        }
                    case .failure(let error):
                        print("Error fetching data: \(error)")
                    }
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("알림"),message: Text(alertMsg),
                  dismissButton: .default(Text("확인") ) )
        }
    } // body
    
    @State var showAlert : Bool = false
    @State var alertMsg = ""
    
} // painRecordResultSwiftUIView

struct RequestRecord : Encodable {
//    {
//        "location": "무릎",
//        "intensity":3,
//        "trigger":"앉을때",
//        "type":["뻑뻑함"],
//        "painTimestamp":"2024-05-26T10:34:20"
//    }
    let location :[String]
    let intensity : Int
    let trigger : String
    let type : [String]
    let painTimestamp: String
}

//// Result Row
//func resultRow(text: String) -> some View {
//    Text("\(text)")
//        .font(.system(size: 15))
//        .foregroundStyle(.white)
//        .padding(.horizontal, 20)
//        .padding(.vertical, 10)
//        .background(Color(hex: 0x0E0E0E, alpha: 0.5))
//        .cornerRadius(26)
//}
// ~ sy-gwak
