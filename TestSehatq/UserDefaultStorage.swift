//
//  UserDefaultStorage.swift
//  TestSehatq
//
//  Created by rizky satria on 06/07/21.
//

import Foundation

protocol UserDefaultStorageProtocol {
    func getIsLogin() -> Bool
    func setIsLogin(isLogin: Bool)
    func clearToken()
}

class UserDefaultStorage: UserDefaultStorageProtocol {
    
    private let defaults = UserDefaults.standard
    private let isLoginKey = "isLogin"
    
    func getIsLogin() -> Bool {
        return defaults.value(forKey: isLoginKey) as? Bool ?? false
    }
    
    func setIsLogin(isLogin: Bool) {
        defaults.setValue(isLogin, forKey: isLoginKey)
    }
    
    func clearToken() {
        defaults.removeObject(forKey: isLoginKey)
    }
    
}
