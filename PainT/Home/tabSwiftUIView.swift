//
//  tabSwiftUIView.swift
//  PainT
//
//  Created by 최승희 on 4/29/24.
//

import SwiftUI

struct tabSwiftUIView: View {
    @State private var selectedTab = 0
    
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
                // myPage
                myPageSwiftUIView()
                    .tabItem {
                        Label("마이페이지", image: selectedTab == 2 ? "mypage-colored" : "mypage-default")
                    }
                    .tag(2)
            } // TabView
            .navigationBarBackButtonHidden()
        } // NavigationView
    }
}

#Preview {
    tabSwiftUIView()
}
