//
//  webLoginSwiftUiView.swift
//  PainT
//
//  Created by Shin Yeong Gwak on 5/11/24.
//

import SwiftUI
import WebKit

struct webLoginSwiftUiView: UIViewRepresentable {
    var type: String
    var urlToLoad: String!
    
    
    init(type: String) {
        self.type = type
        if(self.type == "google"){
            self.urlToLoad = "https://accounts.google.com/o/oauth2/auth?client_id=365828773390-3312e7gi9r312aebng0ma2v407aiehqm.apps.googleusercontent.com&redirect_uri=http://localhost:8060/api/v1/users/oauth2/code/google&response_type=code&scope=https://www.googleapis.com/auth/userinfo.email+openid+https://www.googleapis.com/auth/userinfo.profile"
        }
    }
    
    //override
    func makeUIView(context: Context) -> WKWebView {
        guard let url = URL(string: self.urlToLoad) else {
            return WKWebView()
        }
        let webView = WKWebView()
            
        print()
        
        webView.customUserAgent = "Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.0 Mobile/15E148 Safari/604.1";
            
        webView.load(URLRequest(url: url))
        
        return webView
    }
    //override
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
    
    typealias UIViewType = WKWebView
}

#Preview {
    webLoginSwiftUiView(type:"google")
}
