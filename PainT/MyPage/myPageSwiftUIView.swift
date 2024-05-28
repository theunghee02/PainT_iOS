//
//  myPageSwiftUIView.swift
//  PainT
//
//  Created by 최승희 on 4/29/24.
//

import SwiftUI

struct myPageSwiftUIView: View {
    @State var logoutNavigate : Bool = false
    @Binding var stack:NavigationPath
    @EnvironmentObject private var appRootManager: AppRootManager
    
    var body: some View {
        NavigationStack(path: $stack) {
            VStack {
                List {
                    Button("로그아웃") {
                        let svc = UserDefaultsService()
                        svc.deleteAccessToken()
                        svc.deleteRefreshToken()
                        
                        appRootManager.currentRoot = .authentication
                        
                    }
                    .foregroundColor(.black)
                    
                }
            } // VStack
            .navigationTitle("마이페이지")
            .navigationDestination(isPresented: $logoutNavigate) {
                loginSwiftUIView(stack: stack)
            }
            .navigationBarBackButtonHidden(true)
            
            
        } // NavigationView
        .navigationBarBackButtonHidden(true)

    }
}

