//
//  StackedSwiftUIView.swift
//  PainT
//
//  Created by Shin Yeong Gwak on 5/30/24.
//

import SwiftUI

struct StackedSwiftUIView: View {
    @Binding var stack : [String] //String값에다가 계속 해당 이름 뷰 넣어놓기.
    var body: some View {

        if stack.last == "eulaSwiftUIView" {
            eulaSwiftUIView(stack: $stack)
        } else if stack.last == "signUpSwiftUIView" {
            signUpSwiftUIView(stack: $stack)
        } else if stack.last == "mailVerifySwiftUIView" {
            mailVerifySwiftUIView(stack: $stack)
        }
        
    }
}
