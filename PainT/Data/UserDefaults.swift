//
//  UserDefaults.swift
//  PainT
//
//  Created by Shin Yeong Gwak on 5/10/24.
//

import Foundation


class UserDefaultsService {
    // 토큰을 저장할 Key
    let tokenKey = "AccessToken"
    let refreshKey = "RefreshToken"
    
    // 토큰을 UserDefaults에 저장하는 함수
    func saveAccessToken(token: String) {
        UserDefaults.standard.set(token, forKey: tokenKey)
    }
    
    func saveRefreshToken(token: String) {
        UserDefaults.standard.set(token, forKey: refreshKey)
    }
    
    
    // UserDefaults에서 토큰을 가져오는 함수
    func getAccessToken() -> String? {
        return UserDefaults.standard.string(forKey: tokenKey)
    }
    
    func getRefreshToken() -> String? {
        return UserDefaults.standard.string(forKey: refreshKey)
    }
    
    // 토큰을 삭제하는 함수 (로그아웃 등에 사용)
    func deleteAccessToken() {
        UserDefaults.standard.removeObject(forKey: tokenKey)
    }
    func deleteRefreshToken() {
        UserDefaults.standard.removeObject(forKey: refreshKey)
    }
}
