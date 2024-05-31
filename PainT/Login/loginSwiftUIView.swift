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
    
    @State private var isLoading = false
    
    
    @State var stack : [StackView<Any>] = []
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
        
        NavigationStack(path: $stack) {
            
                
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
                        isLoading = true
                        if(login()) {
                            username = ""
                            password = ""
                            withAnimation(.spring()) {
                                isLoading = false
                                appRootManager.currentRoot = .home
                            }
                        }

                    }
                    .buttonStyle(BasicButtonStyle())
                    
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
                    
                    Button("회원가입") {
                        stack.append(StackView(type:.eula,content:""))
                    }
                    .buttonStyle(BasicButtonStyle())
                    
                    
                } // VStack
                .padding()
                .navigationDestination(for: StackView<Any>.self) { stackView in
                    switch stack.last?.type {
                    case .mail:
                        mailVerifySwiftUIView(stack:$stack)
                    case .eula:
                        eulaSwiftUIView(stack:$stack)
                    case .sign:
                        signUpSwiftUIView(stack: $stack,isAgreed4: stack.last?.content as! Bool)
                    case .none:
                        self
                    }
                }
                //.toolbar(.hidden, for: .navigationBar)
                .onChange(of: shouldNavigate) {
                    username = ""
                    password = ""
                    appRootManager.currentRoot = .home
                }
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("알림"),
                        message: Text(showAlertMsg),
                        dismissButton: .default(Text("확인"))
                    )
                } // alert
            
        } // NavigationStack
        .navigationBarBackButtonHidden(true)
        .overlayIf(isLoading, ProgressView()
            .progressViewStyle(CircularProgressViewStyle()) // 로딩 바 스타일 설정
            .scaleEffect(2) // 크기 조절
            .padding(.top, 60)
            .opacity(isLoading ? 1 : 0) // 로딩 중에만 보이도록 설정)
                   )
        //.toolbar(.hidden,for:.tabBar)
        
            
        
        
    }
    private func login() -> Bool {
        if password.isEmpty || username.isEmpty {
            // alert!
            self.showAlertMsg = "아이디, 비밀번호를 확인해주세요."
            self.showAlert = true;
            
        }
        else {
            isLoading = true
            
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
                        userDefaults.saveAccessToken(token: (value.0?.result.accessToken)!)
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
            isLoading = false
            return true
        }
        isLoading = false
        return false
        
    }// function

    
    
}

#Preview {
    loginSwiftUIView()
}


enum StackViewType {
    case sign
    case eula
    case mail
}

struct StackView<T>: Hashable {
    public func hash(into hasher: inout Hasher) {
            return hasher.combine(type)
        }
    static func == (lhs: StackView<T>, rhs: StackView<T>) -> Bool {
        return lhs.type == rhs.type
    }
    
    let type: StackViewType
    let content: T
}
