//
//  myPageSwiftUIView.swift
//  PainT
//
//  Created by 최승희 on 4/29/24.
//

import SwiftUI

struct myPageSwiftUIView: View {
    @State var logoutNavigate : Bool = false
    
    @EnvironmentObject private var appRootManager: AppRootManager
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("마이페이지")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
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
            .navigationDestination(isPresented: $logoutNavigate) {
                loginSwiftUIView()
            }
            .navigationBarBackButtonHidden(true)
            
            
        } // NavigationView
        .navigationBarBackButtonHidden(true)

    }
}

#Preview {
    myPageSwiftUIView()
}
