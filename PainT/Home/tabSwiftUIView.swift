//
//  tabSwiftUIView.swift
//  PainT
//
//  Created by 최승희 on 4/29/24.
//

import SwiftUI

struct tabSwiftUIView: View {
    var body: some View {
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
            myPageSwiftUIView()
                .tabItem {
                    Image("mypage-default")
                }
        }
    }
}

#Preview {
    tabSwiftUIView()
}
