//
//  LoginViewController.swift
//  TestSehatq
//
//  Created by rizky satria on 06/07/21.
//

import UIKit
import FBSDKLoginKit
import RxSwift

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginWithFBButton: FBLoginButton!
    
    private let loginManager = LoginManager()
    private let disposeBag = DisposeBag()
    
    class func create() -> LoginViewController {
        return Utility.getViewControllerFromStoryboard("LoginViewController", storyboardName: "Login") as! LoginViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
    }
    
    private func setupButtons() {
        
        loginWithFBButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.onTapLoginButton()
        }).disposed(by: disposeBag)
        
    }
    
    private func onTapLoginButton() {
        let loginManager = LoginManager()
        loginManager.logOut()
        loginManager.logIn(permissions: [ .email ], viewController: self) { loginResult in
                switch loginResult {
                case .failed(let error):
                    print(error)
                case .cancelled:
                    print("User cancelled login.")
                case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                    print("Logged in!")
                    //Do further code...
                }
            }
    }
    
    
    
}
