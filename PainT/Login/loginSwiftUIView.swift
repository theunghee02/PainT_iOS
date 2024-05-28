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
    @EnvironmentObject  private  var  appRootManager : AppRootManager
    
    
    @State var stack:NavigationPath = NavigationPath()
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showAlert = false;
    @State private var showAlertMsg = "";
    
    @State private var shouldNavigate = false
    @State private var googleClicked = false
    @State private var kakaoClicked = false
    @State private var appleClicked = false

    @State private var accessToken = ""
    @State private var message = ""
    
    


    var body: some View {
        
        NavigationStack {
            
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
                        username = ""
                        password = ""
                        withAnimation(.spring()) {
                            appRootManager.currentRoot = .home
                        }
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
                    Button {
                            googleClicked = true
                          } label: {
                              Image("google")
                                  .resizable()
                                  .aspectRatio(contentMode: .fit)
                                  .scaledToFit()
                                  .frame(width: 80, height: 80)
                          }
                    .sheet(isPresented: $googleClicked, onDismiss: {
                        print("Dismiss")
                    }, content: {                    webLoginSwiftUiView(isPresented: $googleClicked, success: $shouldNavigate, type: "google")
                        
                      })
                    
                    Spacer()
                    
                    Button {
                            appleClicked = true
                          } label: {
                              Image("apple")
                                  .resizable()
                                  .aspectRatio(contentMode: .fit)
                                  .scaledToFit()
                                  .frame(width: 80, height: 80)
                          }
                    .sheet(isPresented: $appleClicked, onDismiss: {
                        print("Dismiss")
                    }, content: {                    webLoginSwiftUiView(isPresented: $appleClicked, success: $shouldNavigate, type: "apple")
                        
                      })
                    
                    Spacer()
                    
                    Button {
                            kakaoClicked = true
                          } label: {
                              Image("kakao")
                                  .resizable()
                                  .aspectRatio(contentMode: .fit)
                                  .scaledToFit()
                                  .frame(width: 80, height: 80)
                          }
                    .sheet(isPresented: $kakaoClicked, onDismiss: {
                        print("Dismiss")
                    }, content: {                    webLoginSwiftUiView(isPresented: $kakaoClicked, success: $shouldNavigate, type: "kakao")
                        
                      })
                    Spacer()
                    
                    
                } // HStack
                .padding()
               
                    
                Spacer()
                    
                NavigationLink(destination: eulaSwiftUIView(stack: $stack)) {
                    Text("회원가입")
                }
                .buttonStyle(BasicButtonStyle())
                
                
            } // VStack
            .padding()
            .toolbar(.hidden, for: .navigationBar)
            .onChange(of: shouldNavigate) {
                appRootManager.currentRoot = .home
            }
        } // NavigationStack
        .navigationBarBackButtonHidden(true)
        .toolbar(.hidden,for:.tabBar)
        
            
        
        
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

