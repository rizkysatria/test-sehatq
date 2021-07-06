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
    func getIsRememberMeActive() -> Bool
    func setIsRememberMeActive(isActive: Bool)
}

class UserDefaultStorage: UserDefaultStorageProtocol {
    
    private let defaults = UserDefaults.standard
    private let isLoginKey = "isLogin"
    private let isRememberMeActive = "isRememberMeActive"
    
    func getIsLogin() -> Bool {
        return defaults.value(forKey: isLoginKey) as? Bool ?? false
    }
    
    func setIsLogin(isLogin: Bool) {
        defaults.setValue(isLogin, forKey: isLoginKey)
    }
    
    func getIsRememberMeActive() -> Bool {
        return defaults.value(forKey: isRememberMeActive) as? Bool ?? false
    }
    
    func setIsRememberMeActive(isActive: Bool) {
        defaults.setValue(isActive, forKey: isRememberMeActive)
    }
    
}
