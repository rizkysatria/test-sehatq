//
//  LoginViewModelTests.swift
//  TestSehatqTests
//
//  Created by rizky satria on 07/07/21.
//

import XCTest
import RxSwift
@testable import TestSehatq

class LoginViewModelTests: XCTestCase {
    
    private var loginViewModel: LoginViewModel!
    
    private let disposeBag = DisposeBag()

    override func setUp() {
        super.setUp()
        loginViewModel = LoginViewModel(userDefaultStorage: UserDefaultStorage())
    }
    
    override func tearDown() {
        super.tearDown()
        loginViewModel = nil
    }
    
    
    func testSignIn() {
        loginViewModel.userName.accept("admin")
        loginViewModel.password.accept("admin")
        
        loginViewModel.rxEventSuccessLogin
            .subscribe(onNext: {
                XCTAssertTrue(true, "must be called")
        }).disposed(by: disposeBag)
        
        loginViewModel.onTapLoginButton()
    }
    
    func testInvalidLogin() {
        loginViewModel.userName.accept("admin123")
        loginViewModel.password.accept("admin123")
        
        loginViewModel.rxEventInvalidLogin
            .subscribe(onNext: {
                XCTAssertTrue(true, "must be called")
        }).disposed(by: disposeBag)
        
        loginViewModel.onTapLoginButton()
    }
    
    func testOnTapRememberMe() {
        loginViewModel.setActiveRememberMe(isActive: true)
        XCTAssertTrue(loginViewModel.isRememberMeActive == true, "tap remember me must be true")
    }
    
}
