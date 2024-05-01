//
//  ContentView.swift
//  expui
//
//  Created by Shin Yeong Gwak on 2024/04/23.
//
//

import SwiftUI
import Alamofire
import Foundation


// LoginView에 복사함 (나중에 메인이 이페이지가 아닐때 조작 계획중)

@available(iOS 17.0, *)
struct loginSwiftUIView: View {
    //@EnvironmentObject var variable: Variable


    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showAlert = false;
    @State private var showAlertMsg = "";

    @State private var accessToken = ""
    @State private var message = ""


    var body: some View {
        ZStack {
            NavigationView {
                VStack(spacing: 10) {
                    Spacer()
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


                    Button("Login"){
                        login()
                        AF.request("http://34.22.95.16/api/v1/user/login", method: .post, parameters: ["username": username, "password": password], encoding: JSONEncoding.default).responseDecodable(of: Response.self) { response in
                            switch response.result {
                            case .success(let value):
                                if value.code == 2000{
                                    accessToken = value.result.accessToken
                                } else {
                                    showAlertMsg = "틀렸어요!"
                                    showAlert=true;
                                }
                            case .failure(let error):
                                print("Error: \(error)")
                                return
                            }
                        }
                    }
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height:40)
                            .padding(10)
                            .background(Color.black)
                            .cornerRadius(10)
                            .alert(isPresented: $showAlert) {
                                Alert(
                                        title: Text("알림"),
                                        message: Text(showAlertMsg),
                                        dismissButton: .default(Text("확인"))
                                )
                            }

                    Text("Access Token: \(accessToken)")

                    NavigationLink(destination: findPasswordSwiftUIView()) {
                        Text("비밀번호를 잊으셨나요?")
                    }
                            .padding(1)
                            .font(.subheadline)


                    // 소셜 로그인 버튼 추가 구현


                    Spacer()

                    NavigationLink(destination: signUpSwiftUIView()) {
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
            showAlertMsg = "아이디, 비밀번호를 확인해주세요."
            showAlert = true;
            showAlert = false;
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
                .background(Color.black)
                .cornerRadius(10)
    }
}


#Preview {
    loginSwiftUIView()
}

struct Response: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: Result
}

struct Result: Codable {
    let accessToken: String
    let grantType: String
}
