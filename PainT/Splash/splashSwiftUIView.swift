//
//  splashSwiftUIView.swift
//  PainT
//
//  Created by Shin Yeong Gwak on 5/20/24.
//

import SwiftUI

struct splashSwiftUIView: View {
    
    @EnvironmentObject private var appRootManager: AppRootManager
    
    var body: some View {
        ZStack {
            Image("appIcon")
        }
        
        .onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                let userDefaults = UserDefaultsService()
                if(userDefaults.getAccessToken() != nil) {
                    withAnimation(.spring()) {
                        appRootManager.currentRoot = .home
                    }
                }else {
                    withAnimation(.spring()) {
                        appRootManager.currentRoot = .authentication
                    }
                }
            }
        }
    }
}
