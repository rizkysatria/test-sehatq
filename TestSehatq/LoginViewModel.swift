//
//  LoginViewModel.swift
//  TestSehatq
//
//  Created by rizky satria on 06/07/21.
//

import Foundation
import GoogleSignIn
import FBSDKLoginKit
import RxSwift
import RxCocoa

class LoginViewModel {
    
    var userName = BehaviorRelay<String>(value: "")
    var password = BehaviorRelay<String>(value: "")
    
    var rxEventSuccessLogin: PublishSubject<Void> {
        return eventSuccessLogin
    }
    
    private (set) var isRememberMeActive: Bool = false
    private let loginManager = LoginManager()
    private let eventSuccessLogin = PublishSubject<Void>()
    private let userDefaultStorage: UserDefaultStorageProtocol!
    
    init(userDefaultStorage: UserDefaultStorageProtocol) {
        self.userDefaultStorage = userDefaultStorage
        setupGoogleSignIn()
    }
    
    private func setupGoogleSignIn() {
        if let googleClientID = Bundle.main.object(forInfoDictionaryKey: "GoogleClientID") as? String {
            GIDSignIn.sharedInstance().clientID = googleClientID
        }
    }
    
    func facebookSignIn(delegate: UIViewController) {
        let loginManager = LoginManager()
        loginManager.logOut()
        loginManager.logIn(permissions: [.email], viewController: delegate) { [weak self] loginResult in
                switch loginResult {
                case .failed(let error):
                    print(error)
                case .cancelled:
                    print("User cancelled login.")
                case .success(_ , _, _):
                    self?.onSuccessLogin()
                }
            }
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print(error)
        } else {
            onSuccessLogin()
        }
    }
    
    func onTapLoginButton() {
        let userModel = UserModel()
        if userName.value == userModel.userName && password.value == userModel.password {
            userDefaultStorage.setIsLogin(isLogin: true)
            userDefaultStorage.setIsRememberMeActive(isActive: isRememberMeActive)
            eventSuccessLogin.onNext(())
        }
    }
    
    func setActiveRememberMe(isActive: Bool) {
        isRememberMeActive = isActive
    }
    
    private func onSuccessLogin() {
        userDefaultStorage.setIsLogin(isLogin: true)
        eventSuccessLogin.onNext(())
    }
       
}
