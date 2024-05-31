//
//  AuthService.swift
//  PainT
//
//  Created by Shin Yeong Gwak on 5/22/24.
//

import Alamofire
import Foundation

class AuthService {
    var apiPath :String
    var hostUrl :String = "http://chi-iu.com"
    
    var tkSvc : UserDefaultsService
    
    
    init(apiPath: String) {
        self.apiPath = apiPath
        self.tkSvc = UserDefaultsService()
    }
    
    
    // get - 파라미터 O
    public func getRequest<T: Decodable>(parameters:Parameters,resultType: T.Type,completion: @escaping (Result<GenericResponse<T>, Error>) -> Void) {
        let headers: HTTPHeaders = [.authorization(bearerToken: tkSvc.getAccessToken()!)]

        AF.request(hostUrl+apiPath, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers)
            .responseDecodable(of: GenericResponse<T>.self) { response in
                
            switch response.result {
            case .success(let value):
                if(value.code == 4002) { // 인증 만료시
                    let cookies = HTTPCookie.cookies(withResponseHeaderFields: response.response?.allHeaderFields as? [String: String] ?? [:], for: response.request?.url ?? URL(string: self.hostUrl)!)

                    let refreshTokenCookie = cookies.first { $0.name == "REFRESH_TOKEN" && $0.path == "/" }
                    let rt : String = refreshTokenCookie?.value ?? ""
                    if (rt != "") {
                        self.tkSvc.saveRefreshToken(token: rt)
                    }
                    if let accessToken = response.response?.allHeaderFields["Authorization"] as? String {
                        self.tkSvc.saveAccessToken(token: accessToken)
                    }
                    
                    //재귀 호출하면 문제 해결
                    
                    self.getRequest<T>(parameters: parameters,resultType: resultType,completion: completion)
                    
                } else {
                    completion(.success(value))
                }
                
            case .failure(let error):
                print("실패다 : \(error)")
                completion(.failure(error))
            }
                
        }
    }
    
    // get - 파라미터 X
    public func getRequest(completion: @escaping (Result<Response, Error>) -> Void) {
        let headers: HTTPHeaders = [.authorization(bearerToken: tkSvc.getAccessToken()!)]

        AF.request(hostUrl+apiPath, method: .get, encoding: URLEncoding.default, headers: headers)
            .responseDecodable(of: Response.self) { response in
                
            switch response.result {
            case .success(let value):
                if(value.code == 4002) { // 인증 만료시
                    let cookies = HTTPCookie.cookies(withResponseHeaderFields: response.response?.allHeaderFields as? [String: String] ?? [:], for: response.request?.url ?? URL(string: self.hostUrl)!)

                    let refreshTokenCookie = cookies.first { $0.name == "REFRESH_TOKEN" && $0.path == "/" }
                    let rt : String = refreshTokenCookie?.value ?? ""
                    if (rt != "") {
                        self.tkSvc.saveRefreshToken(token: rt)
                    }
                    if let accessToken = response.response?.allHeaderFields["Authorization"] as? String {
                        self.tkSvc.saveAccessToken(token: accessToken)
                    }
                    
                    //재귀 호출하면 문제 해결
                    
                    self.getRequest(completion: completion)
                    
                } else {
                    completion(.success(value))
                }
                
            case .failure(let error):
                print("실패다 : \(error)")
                completion(.failure(error))
            }
                
        }
    }
    
    // post - 파라미터 O
    // sy-gwak edit => parameter -> encodable
    public func postRequest(parameters: Encodable,completion: @escaping (Result<Response, Error>) -> Void) {
        let headers: HTTPHeaders = [.authorization(bearerToken: tkSvc.getAccessToken()!)]

        AF.request(hostUrl+apiPath, method: .post, parameters: parameters , encoder: JSONParameterEncoder.default, headers: headers)
            .responseDecodable(of: Response.self) { response in
                
            switch response.result {
            case .success(let value):
                if(value.code == 4002) { // 인증 만료시
                    let cookies = HTTPCookie.cookies(withResponseHeaderFields: response.response?.allHeaderFields as? [String: String] ?? [:], for: response.request?.url ?? URL(string: self.hostUrl)!)
                    
                    let refreshTokenCookie = cookies.first { $0.name == "REFRESH_TOKEN" && $0.path == "/" }
                    let rt : String = refreshTokenCookie?.value ?? ""
                    if (rt != "") {
                        self.tkSvc.saveRefreshToken(token: rt)
                    }
                    if let accessToken = response.response?.allHeaderFields["Authorization"] as? String {
                        self.tkSvc.saveAccessToken(token: accessToken)
                    }
                    
                    //재귀 호출하면 문제 해결
                } else {
                    self.postRequest(parameters: parameters,completion: completion)
                    completion(.success(value))
                }
                
            case .failure(let error):
                print("실패다 : \(error)")
                completion(.failure(error))
            }
                
        }
    }
    
    // post - 파라미터 X
    public func postRequest<T: Decodable>(resultType: T.Type, completion: @escaping (Result<GenericResponse<T>, Error>) -> Void) {
        
        let headers: HTTPHeaders = [.authorization(bearerToken: tkSvc.getAccessToken()!)]

        AF.request(hostUrl+apiPath, method: .post, headers: headers)
            .responseDecodable(of: GenericResponse<T>.self) { response in
            switch response.result {
            case .success(let value):
                print("성공 AF.request: ", value)
                print("-----------------")
                do {
                    if(value.code == 4002) { // 인증 만료시
                        let cookies = HTTPCookie.cookies(withResponseHeaderFields: response.response?.allHeaderFields as? [String: String] ?? [:], for: response.request?.url ?? URL(string: self.hostUrl)!)
                        
                        let refreshTokenCookie = cookies.first { $0.name == "REFRESH_TOKEN" && $0.path == "/" }
                        let rt : String = refreshTokenCookie?.value ?? ""
                        if (rt != "") {
                            self.tkSvc.saveRefreshToken(token: rt)
                        }
                        if let accessToken = response.response?.allHeaderFields["Authorization"] as? String {
                            self.tkSvc.saveAccessToken(token: accessToken)
                        }
                        self.postRequest(resultType: resultType, completion: completion)
                        //재귀 호출하면 문제 해결
                    } else {
                        completion(.success(value))
                    }
                }
                
            case .failure(let error):
                print("실패 AF.request: ", error)
                print("-----------------")
                print("Request error : \(error)")
                completion(.failure(error))
            }
        }
    }
}
