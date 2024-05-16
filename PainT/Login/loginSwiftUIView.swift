//
//  ContentView.swift
//  expui
//
//  Created by Shin Yeong Gwak on 2024/04/23.
//
//

import SwiftUI
import Alamofire


// LoginView에 복사함 (나중에 메인이 이페이지가 아닐때 조작 계획중)

@available(iOS 17.0, *)
struct loginSwiftUIView: View {
    //@EnvironmentObject var variable: Variable

    @State var stack: NavigationPath = NavigationPath()

    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showAlert = false;
    @State private var showAlertMsg = "";
    
    @State private var shouldNavigate = false

    @State private var accessToken = ""
    @State private var message = ""


    var body: some View {
        
        NavigationView {
            @State var stack: NavigationPath = NavigationPath()
            VStack(spacing: 10) {
                Spacer(minLength: 40)
                Image("appIcon")
                    .padding(50)
                TextField("ID", text: $username)
                    .padding()
                    .cornerRadius(10)
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.gray, lineWidth: 1) // 외곽선 추가
                    )
                SecureField("PW", text: $password)
                    .padding()
                    .cornerRadius(10)
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.gray, lineWidth: 1) // 외곽선 추가
                    )
                
                
                Button("로그인"){
                    if(login()) {
                        shouldNavigate = true
                    }
                    print("\(shouldNavigate)")
                }
                .buttonStyle(BasicButtonStyle())
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("알림"),
                        message: Text(showAlertMsg),
                        dismissButton: .default(Text("확인"))
                    )
                } // alert
                    
                NavigationLink(destination: findPasswordSwiftUIView()) {
                    Text("비밀번호를 잊으셨나요?")
                }
                .padding(10)
                .font(.subheadline)
                   
                Spacer()
                Text("or")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                HStack {
                    Spacer()
                    NavigationLink(destination: webLoginSwiftUiView(type: "google")) {
                        Image("google")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: webLoginSwiftUiView(type: "kakao")) {
                        Image("kakao")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .scaledToFit()
                            .frame(width: 75, height: 75)
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: webLoginSwiftUiView(type: "apple")) {
                        Image("apple")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                    }
                    Spacer()
                    
                    
                } // HStack
                .padding()
               
                    
                Spacer()
                    
                NavigationLink(destination: eulaSwiftUIView()) {
                    Text("회원가입")
                }
                .buttonStyle(BasicButtonStyle())
                
                
            } // VStack
            .padding()
            .navigationDestination(isPresented: $shouldNavigate){
                tabSwiftUIView()
            }
        } // NavigationView
        .navigationBarBackButtonHidden()
            
        
        
    }
    private func login() -> Bool {
        if password.isEmpty || username.isEmpty {
            // alert!
            showAlertMsg = "아이디, 비밀번호를 확인해주세요."
            showAlert = true;
            showAlert = false;
        }
        else {
            let parameters = ["username":username,"password":password]
            
            // 저장소 서비스 생성
            let userDefaults = UserDefaultsService()
            
            let userService :UserService = UserService(apiPath: "/api/v1/users/login")
            userService.loginRequest(parameters:parameters)
            { result in
                switch result {
                case .success(let value):
                    print(value.0?.message as Any)
                    if(value.0?.code == 2000) {
                        userDefaults.saveAccessToken(token: (value.0?.result.grantType)!+" "+(value.0?.result.accessToken)!)
                        userDefaults.saveRefreshToken(token: value.1 ?? "non")
                        shouldNavigate = true
                    } else {
                        showAlertMsg = value.0!.message
                        showAlert = true
                    }
                case .failure(let error):
                    print("Error fetching data: \(error)")
                }
            }// loginRequest
        }
        if(shouldNavigate){
            return true
        }
        return false
        
    }// function
    
    
}

#Preview {
    loginSwiftUIView()
}

