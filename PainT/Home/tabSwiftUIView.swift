//
//  tabSwiftUIView.swift
//  PainT
//
//  Created by 최승희 on 4/29/24.
//

import SwiftUI

struct tabSwiftUIView: View {
    @State var stack = NavigationPath()
    
    @State private var selectedTab = 0
    
//    init() {
//        // UITabBar의 배경색을 하얗게 설정
//        UITabBar.appearance().barTintColor = .white
//        UITabBar.appearance().isTranslucent = false // 배경을 불투명하게 설정
//    }
    
    var body: some View {
        NavigationView {
            TabView(selection: $selectedTab) {
                // home
                homeSwiftUIView()
                    .tabItem {
                        Label("홈", image: selectedTab == 0 ? "homeGNB-colored" : "homeGNB-default")
                    }
                    .tag(0)
                // painStat
                painStatSwiftUIView()
                    .tabItem {
                        Label("통증 통계", image: selectedTab == 1 ? "painStat-colored" : "painStat-default")
                    }
                    .tag(1)
                    .background(Color.white)
                // myPage
                myPageSwiftUIView()
                    .tabItem {
                        Label("마이페이지", image: selectedTab == 2 ? "mypage-colored" : "mypage-default")
                    }
                    .tag(2)
            } // TabView
            .background {
                    RoundedRectangle(cornerRadius: 24)
                        .fill(Color.white)
                        .shadow(color: .black.opacity(0.15), radius: 8, y: 2)
                }
        } // NavigationView
        .toolbar(.visible, for:.navigationBar)
        
    }
}

#Preview {
    tabSwiftUIView()
}
