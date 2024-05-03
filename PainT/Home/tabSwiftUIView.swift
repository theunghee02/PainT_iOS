//
//  tabSwiftUIView.swift
//  PainT
//
//  Created by 최승희 on 4/29/24.
//

import SwiftUI

struct tabSwiftUIView: View {
    var body: some View {
        NavigationView {
            TabView {
                // home
                homeSwiftUIView()
                    .tabItem {
                        Image("homeGNB-default")
                    }
                // painStat
                painStatSwiftUIView()
                    .tabItem {
                        Image("painStat-default")
                    }
                // myPage
                myPageSwiftUIView()
                    .tabItem {
                        Image("mypage-default")
                    }
            } // TabView
            .navigationBarBackButtonHidden()
        } // NavigationView
    }
}

#Preview {
    tabSwiftUIView()
}
