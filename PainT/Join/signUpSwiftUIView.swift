//
//  signUpSwiftUIView.swift
//  PainT
//
//  Created by Shin Yeong Gwak on 5/1/24.
//

import SwiftUI

struct signUpSwiftUIView: View {
    
    @State var stack: NavigationPath = NavigationPath()
    @State private var shouldNavigate = false
    
    @State private var canSubmit = false
    
    @State var isAgreed4 : Bool
    @State var username : String = ""
    @State var password : String = ""
    @State var passwordcheck : String = ""
    @State var realName : String = ""
    @State var email : String = ""
    @State private var isFeMale = false
    @State private var isMale = false
    @State private var birthday:Date = Date()
    
    @State private var gender: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading){
                    NameFieldMapComponent(fieldDest: "아이디", fieldName: "ID", fieldValue: $username, needButton: true)
                    PasswordFieldMapComponent(fieldDest: "비밀번호", fieldName: "PW", fieldValue: $password)
                    PasswordFieldMapComponent(fieldDest: "비밀번호 확인", fieldName: "PW", fieldValue: $passwordcheck)
                    
                    if(password != passwordcheck){
                        Text("비밀번호가 다릅니다. 확인해주세요.")
                            .font(.subheadline)
                            .foregroundColor(Color.accentColor)
                    } else if(password.count < 11) {
                        Text("작성하신 비밀번호가 너무 짧습니다.")
                            .font(.subheadline)
                            .foregroundColor(Color.accentColor)
                    }
                    
                    Spacer(minLength: 50)
                    
                    NameFieldMapComponent(fieldDest: "이름", fieldName: "Name", fieldValue: $realName, needButton: false)
                    NameFieldMapComponent(fieldDest: "이메일", fieldName: "Email", fieldValue: $email, needButton: true)
                    
                    HStack {
                        Text("성별")
                        RadioButtonView(index: true, gender: $gender)
                        RadioButtonView(index: false, gender: $gender)
                    }
                    
                    DatePicker("생년월일", selection: $birthday, displayedComponents: .date)
                                    .datePickerStyle(CompactDatePickerStyle())
                    
                    Spacer(minLength: 50)
                    Button("제출"){
                        let parameters = ["username": username,
                                          "password": password,
                                          "email":email,
                                          "realName":realName,
                                          "gender":gender,
                                          "birthday":birthday,
                                          "agreeMarketing":isAgreed4
                                         ]
                        
                        let userService = UserService(apiPath: "/api/v1/users/signup")
                        userService.voidRequest(parameters: parameters) 
                        { result in
                            switch result {
                            case .success(let value):
                                if(value.code == 2000) {
                                    shouldNavigate = true
                                }
                                else {
                                    print(value.message)
                                }
                            case .failure(let error):
                                print("Error fetching data: \(error)")
                            }
                        }// Request
            
                    }
                    .buttonStyle(BasicButtonStyle())
                    .disabled(canSubmit)
                    
                    
                    NavigationLink(
                        destination: mailVerifySwiftUIView(),
                        isActive: $shouldNavigate) {
                            Text("")
                                .hidden()
                        }
                    
                } // VStack
                
            } // ScrollView
            .navigationTitle("회원 가입")
            .padding()
        } // NavigationView
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    signUpSwiftUIView(isAgreed4: true)
}



struct NameFieldMapComponent : View {
    var fieldDest : String
    var fieldName : String
    @Binding var fieldValue : String
    var needButton : Bool
    
    var body: some View {
        return VStack(alignment: .leading) {
            Text(fieldDest)
            HStack {
                TextField(fieldName, text: $fieldValue)
                    .padding()
                    .cornerRadius(10)
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.gray, lineWidth: 1) // 외곽선 추가
                    )
                if(needButton) {
                    Button("중복 검사") {
                        
                    }
                    .font(.subheadline)
                    .buttonStyle(MiniButtonStyle())
                }
            } // HStack
            
        }
        .padding(.vertical,10)
         // VStack
    }
}

struct PasswordFieldMapComponent : View {
    var fieldDest : String
    var fieldName : String
    @Binding var fieldValue : String
    
    var body: some View {
        return VStack(alignment: .leading) {
            Text(fieldDest)
            SecureField(fieldName, text: $fieldValue)
                    .padding()
                    .cornerRadius(10)
                    .background(
                            RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.gray, lineWidth: 1) // 외곽선 추가
                    )
        }
        .padding(.vertical,10)
         // VStack
    }
}
