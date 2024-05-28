//
//  NoAuthService.swift
//  PainT
//
//  Created by Shin Yeong Gwak on 5/19/24.
//

import Alamofire
import Foundation

class NoAuthService {
    var apiPath :String
    var hostUrl :String = "http://chi-iu.com"
    
    
    init(apiPath: String) {
        self.apiPath = apiPath
    }
    
    

    public func getRequest(parameters:Parameters,completion: @escaping (Result<Response, Error>) -> Void) {

        AF.request(hostUrl+apiPath, method: .get, parameters: parameters, encoding: URLEncoding.default)
            .responseDecodable(of: Response.self) { response in
                
            switch response.result {
            case .success(let value):
                completion(.success(value))
                
            case .failure(let error):
                print("실패다 : \(error)")
                completion(.failure(error))
            }
                
        }
    }
    public func postRequest(parameters:Parameters,completion: @escaping (Result<Response, Error>) -> Void) {

        AF.request(hostUrl+apiPath, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseDecodable(of: Response.self) { response in
                
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
