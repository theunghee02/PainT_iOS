//
//  mailVerifySwiftUIView.swift
//  PainT
//
//  Created by Shin Yeong Gwak on 5/9/24.
//

import SwiftUI

struct mailVerifySwiftUIView: View {
    @Binding var stack : NavigationPath
    @State var code : String = ""
    
    @State private var showAlert = false;
    @State private var showAlertMsg = "";
    @State private var shouldNavigate = false
    
    var body: some View {
        //path: $stack
        NavigationStack() {
            VStack {
                Spacer()
                
                Image("appIcon")
            
                Text("\n감사합니다.")
                    .font(.largeTitle)
                Text("\n귀하의 이메일로 발송된 인증번호를\n 아래에 기입해주세요. (6자리)")
                    .multilineTextAlignment(.center)
                
                NameFieldMapComponent(fieldDest: "여기에 입력", fieldName: "인증번호", fieldValue: $code)
                Button("확인"){
                    if(alertBadInput()) {
                        showAlert = true
                    }
                    verify()
                }
                .buttonStyle(BasicButtonStyle())
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("알림"),
                        message: Text(showAlertMsg),
                        dismissButton: .default(Text("확인"))
                    )
                } // alert
                
                NavigationLink(destination: tabSwiftUIView()) {
                    Text("")
                        .hidden()
                    if(shouldNavigate) {
                        tabSwiftUIView()
                    }
                }
            
            
                Spacer()
                Spacer()
            } // VStack
            .padding()
            
        } // NavigationStack
    }
    func alertBadInput() -> Bool {
        if code.count != 6 || Int(code) == nil {
            showAlertMsg = "잘못 입력하셨습니다."
            showAlert = true
            return true
        }
        return false
    }
    func verify() {
        let param = ["code":code]
        let svc : NoAuthService = NoAuthService(apiPath: "/api/v1/users/verify")
        svc.getRequest(parameters: param) { result in switch result {
            case .success(let value):
                if(value.code == 2000) {
                    shouldNavigate = true
                } else {
                    showAlertMsg = value.message
                    showAlert = true
                    code = ""
                }
            case .failure(let error):
                print("Error fetching data: \(error)")
            }
        }// loginRequest
        
    }
}
