//
//  eulaSwiftUIView.swift
//  PainT
//
//  Created by Shin Yeong Gwak on 5/9/24.
//

import SwiftUI

struct eulaSwiftUIView: View {
    @State private var isAgreed1 = false
    @State private var isAgreed2 = false
    @State private var isAgreed3 = false
    @State private var isAgreed4 = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    EulaComponent(isChecked: $isAgreed1, text: eula1)
                    EulaComponent(isChecked: $isAgreed2, text: eula1)
                    EulaComponent(isChecked: $isAgreed3, text: eula1)
                    EulaComponent(isChecked: $isAgreed4, text: eula1)
                    
                    Spacer(minLength: 30)
                    
                    NavigationLink(destination: signUpSwiftUIView(isAgreed4: isAgreed4)) {
                        Text("다음")
                    }
                    .buttonStyle(NoColorButtonStyle())
                    .background(isAgreed1 && isAgreed2 && isAgreed3 ? Color.accentColor.cornerRadius(10) : Color(.systemGray5).cornerRadius(10))
                    .disabled(!isAgreed1)
                }
            
            } // ScrollView
            .navigationTitle("약관 동의")
            .padding()
            
        } // NavigationView
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image("appIcon")
            }
        }
        
    }
}

struct EulaComponent: View {
    @Binding var isChecked: Bool
    var text: String

    var body: some View {
        VStack(alignment: .leading) {
            ScrollView(.horizontal, showsIndicators: false){
                Text(text)
                    .padding()
                    .frame(alignment: .leading)
            }
            .background(Color(.systemGray5).cornerRadius(10))
            .padding(.vertical,10)
            .frame(maxWidth: .infinity, maxHeight: 300)

            Toggle(isOn: $isChecked) {
                Text("동의합니다.")
            }
            .toggleStyle(checkboxStyle())
        }
        .frame(width: .infinity)
    }
}

#Preview {
    eulaSwiftUIView()
}
