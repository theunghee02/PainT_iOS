//
//  myPageSwiftUIView.swift
//  PainT
//
//  Created by 최승희 on 4/29/24.
//

import SwiftUI

struct myPageSwiftUIView: View {
    @State var logoutNavigate : Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Button("로그아웃") {
                        logoutNavigate = true;
                    }
                    .foregroundColor(.black)
                    
                }
            }
            .navigationTitle("마이페이지")
            .navigationDestination(isPresented: $logoutNavigate) {
                loginSwiftUIView()
                    .toolbar(.hidden, for: .tabBar)
            }
            
        } // NavigationView
            
    }
}

#Preview {
    myPageSwiftUIView()
}
