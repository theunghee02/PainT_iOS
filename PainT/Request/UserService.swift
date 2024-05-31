//
//  UserService.swift
//  PainT
//
//  Created by Shin Yeong Gwak on 5/9/24.
//

import Alamofire
import Foundation

class UserService {
    var apiPath :String
    var hostUrl :String = "http://chi-iu.com"
    
    
    init(apiPath: String) {
        self.apiPath = apiPath
    }
    
    // 로그인용 리퀘스트
    public func loginRequest(parameters: Parameters,completion: @escaping (Result<(Response?, String?), Error>) -> Void) {
        AF.request(hostUrl+apiPath, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseDecodable(of: Response.self) { response in
                
            switch response.result {
            case .success(let value):
                let cookies = HTTPCookie.cookies(withResponseHeaderFields: response.response?.allHeaderFields as? [String: String] ?? [:], for: response.request?.url ?? URL(string: "http://chi-iu.com")!)

                            // 이름이 "REFRESH_TOKEN"이고 경로가 "/"인 쿠키를 찾음
                            let refreshTokenCookie = cookies.first { $0.name == "REFRESH_TOKEN" && $0.path == "/" }
                            // 해당 쿠키의 값을 리턴
                            let refreshToken = refreshTokenCookie?.value
                completion(.success((value,refreshToken)))
                
                
            case .failure(let error):
                print("실패다 : \(error)")
                completion(.failure(error))
            }
                
        }
    }
    
    // 회원가입용 리퀘스트 username:String,password:String,realName:String,email:String,gender:Bool,birthday:Date,isAgreed4:Bool
    
    public func voidRequest(parameters:Encodable,completion: @escaping (Result<ResponseVoid, Error>) -> Void) {


        AF.request(hostUrl+apiPath, method: .post, parameters: parameters, encoder: JSONParameterEncoder.default)
            .responseDecodable(of: ResponseVoid.self) { response in
            switch response.result {
            case .success(let value):
                completion(.success(value))
                
            case .failure(let error):
                print("실패다 : \(error)")
                completion(.failure(error))
            }
                
        }
    }
        
}

struct ResponseVoid: Codable {
    var isSuccess: Bool
    var code: Int
    var message: String
}

struct Response: Codable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: AccessResult!
}

struct AccessResult: Codable {
    let accessToken: String
    let grantType: String
}
