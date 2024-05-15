//
//  unityWebview.swift
//  PainT
//
//  Created by 최승희 on 5/11/24.
//

import SwiftUI
import WebKit

struct unityWebview: UIViewRepresentable {
    
    var urlToLoad: String
    
    func makeUIView(context: Context) -> WKWebView {
        
        guard let url = URL(string: self.urlToLoad) else {
            return WKWebView()
        }
        
        let unityWebview = WKWebView()
        unityWebview.load(URLRequest(url: url))
        
        return unityWebview
    }
    
    // 업데이트 UIView
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<unityWebview>) {
    }
}

#Preview {
    unityWebview(urlToLoad: "https://www.naver.com")
}
