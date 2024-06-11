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

    var body: some View {
        NavigationStack {
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
        } // NavigationStack
        .toolbar(.visible, for: .navigationBar)
    } // body
} // tabSwiftUIView

#Preview {
    tabSwiftUIView()
}

extension UITabBarController {
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        tabBar.layer.masksToBounds = true
        tabBar.layer.cornerRadius = 30
        // Choose with corners should be rounded
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner] // top left, top right

        // Uses `accessibilityIdentifier` in order to retrieve shadow view if already added
        if let shadowView = view.subviews.first(where: { $0.accessibilityIdentifier == "TabBarShadow" }) {
            shadowView.frame = tabBar.frame
        } else {
            let shadowView = UIView(frame: .zero)
            shadowView.frame = tabBar.frame
            shadowView.accessibilityIdentifier = "TabBarShadow"
            shadowView.backgroundColor = UIColor.white
            shadowView.layer.cornerRadius = tabBar.layer.cornerRadius
            shadowView.layer.maskedCorners = tabBar.layer.maskedCorners
            shadowView.layer.masksToBounds = false
            shadowView.layer.shadowColor = Color.black.cgColor
            shadowView.layer.shadowOffset = CGSize(width: 0.0, height: -4.0)
            shadowView.layer.shadowOpacity = 0.05
            shadowView.layer.shadowRadius = 4
            view.addSubview(shadowView)
            view.bringSubviewToFront(tabBar)
        }
    }
}
