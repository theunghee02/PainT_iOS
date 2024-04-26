//
//  ContentView.swift
//  expui
//
//  Created by Shin Yeong Gwak on 2024/04/23.
//
//

import SwiftUI

// LoginView에 복사함 (나중에 메인이 이페이지가 아닐때 조작 계획중)

struct ContentView: View {
    @EnvironmentObject var variable: Variable
    // 이거 없어도 잘 돌아가는 것 같음.
    @Binding var document: expuiDocument
    @State private var username: String = ""
    @State private var password: String = ""
    
    @State var navigated = false
    

    var body: some View {
        ZStack {
            NavigationView {
                VStack(spacing: 10) {
                    Spacer()
                    Image("tmpPaintLogo")
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
                    
                    
                    Button(action: {
                        self.login()
                    }) {
                        Text("로그인")
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height:40)
                    .padding(10)
                    .background(Color(hex: "#04DC88"))
                    .cornerRadius(10)
                    
                    NavigationLink(destination: LoginView()) {
                        Text("비밀번호를 잊으셨나요?")
                    }
                    .padding(1)
                    .font(.subheadline)
                    
                    
                    // 소셜 로그인 버튼 추가 구현
                    
                    
                    Spacer()
            
                    NavigationLink(destination: SignUpView()) {
                        Text("회원가입")
                    }
                    .buttonStyle(CustomButtonStyle())
                }
                .padding()
            }
        }
    }
    private func login() {
        if password.isEmpty || username.isEmpty {
            // alert!
        }
        
        
    }

    private func forgotPassword() {
        
    }

    private func signUp() {
        
    }
}

//?????
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(document: .constant(expuiDocument()))
//    }
//}


struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .frame(height:40)
            .padding(10)
            .background(Color(hex: "#04DC88"))
            .cornerRadius(10)
    }
}

