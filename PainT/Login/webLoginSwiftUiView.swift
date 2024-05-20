//
//  webLoginSwiftUiView.swift
//  PainT
//
//  Created by Shin Yeong Gwak on 5/11/24.
//

import SwiftUI
import WebKit

struct webLoginSwiftUiView: UIViewControllerRepresentable  {
    typealias UIViewControllerType = AuthViewController
    
    @Binding var isPresented: Bool
    
    
    var type: String
    var urlToLoad: String!
    
    
    init(isPresented: Binding<Bool>, type: String) {
        _isPresented = isPresented
        self.type = type
    
        if(self.type == "google"){
            self.urlToLoad = "https://accounts.google.com/o/oauth2/auth?client_id=365828773390-3312e7gi9r312aebng0ma2v407aiehqm.apps.googleusercontent.com&redirect_uri=http://chi-iu.com/api/v1/users/oauth2/code/google&response_type=code&scope=https://www.googleapis.com/auth/userinfo.email+openid+https://www.googleapis.com/auth/userinfo.profile"
        }
    }
    
    //override
    func makeUIViewController(context: Context) -> AuthViewController {
        let viewController = AuthViewController(isPresented: $isPresented)
        viewController.url = urlToLoad
        return viewController
    }
//        let webView = WKWebView()
//
//
//
//        webView.customUserAgent = "Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.0 Mobile/15E148 Safari/604.1";
//
//        webView.load(URLRequest(url: url))
//
//        return webView
//    }
    
    //override
    func updateUIViewController(_ uiViewController: AuthViewController, context: Context) {
    }
    
        

}

class AuthViewController: UIViewController, WKNavigationDelegate {
    private var webView: WKWebView!
    var url: String = ""
    @Binding var isPresented: Bool
    
    @State var cycle: Int = 0
    
    
    init(isPresented: Binding<Bool>) {
            _isPresented = isPresented
            super.init(nibName: nil, bundle: nil)
        }
        
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWebView()
        loadWebView()
    }
    
    private func setupWebView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.navigationDelegate = self
        
    }
    
    private func loadWebView() {
        guard let url = URL(string: url) else {
            return
        }
        let urlRequest = URLRequest(url: url)
        webView.customUserAgent = "Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.0 Mobile/15E148 Safari/604.1";
        print(urlRequest)
        webView.load(urlRequest)
        print("load?")
    }
    func webView(_ webView : WKWebView, didCommit: WKNavigation!) {
        print("머가 되긴 한다")
    }
//
//    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
//        if( cycle > 0){
//            if let url = webView.url,
//               let _ = """
//            document.querySelector('pre').textContent
//            """.data(using: .utf8) {
//                webView.evaluateJavaScript("document.querySelector('pre').textContent") { (value, error) in
//                    if let jsonStr = value as? String,
//                       let jsonData = jsonStr.data(using: .utf8) {
//                        do {
//                            let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: [])
//                            if let result = (jsonObject as? [String: Any])?["result"] as? [String: Any]{
//                                let accessToken = result["accessToken"] as? String
//                                UserDefaultsService().saveAccessToken(token: accessToken!)
//                                let refreshToken = result["refreshToken"] as? String
//                                UserDefaultsService().saveRefreshToken(token: refreshToken!)
//                                print("여기")
//                                self.isPresented = true
//                            }
//                            
//                        } catch {
//                            print("JSON 파싱 오류:", error)
//                        }
//                    }
//                }
//            }
//        }
//        cycle += 1
//    }

    
}

