//
//  LoginViewController.swift
//  TestSehatq
//
//  Created by rizky satria on 06/07/21.
//

import UIKit
import FBSDKLoginKit
import RxSwift
import GoogleSignIn

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginWithFBButton: FBLoginButton!
    @IBOutlet weak var loginWithGoogleButton: UIButton!
    
    var loginViewModel: LoginViewModel!
    
    private let loginManager = LoginManager()
    private let disposeBag = DisposeBag()
    
    class func create() -> LoginViewController {
        return Utility.getViewControllerFromStoryboard("LoginViewController", storyboardName: "Login") as! LoginViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
        setupGoogleSignIn()
    }
    
    private func setupButtons() {
        
        loginWithFBButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.onTapLoginButton()
        }).disposed(by: disposeBag)
        
        loginWithGoogleButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.connectToGoogle()
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
    
    private func setupGoogleSignIn() {
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance()?.presentingViewController = self
    }
    
    private func connectToGoogle() {
        GIDSignIn.sharedInstance().signOut()
        GIDSignIn.sharedInstance().signIn()
    }
    
}

extension LoginViewController: GIDSignInDelegate {
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        loginViewModel.sign(signIn, didSignInFor: user, withError: error)
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
//        loginMenuViewModel.googleAuthenticationComponentViewModel.sign(signIn, didDisconnectWith: user, withError: error)
    }
    
    func sign(inWillDispatch signIn: GIDSignIn!, error: Error!) {
        //Nothing to do!?
    }
    
    func sign(_ signIn: GIDSignIn!, present viewController: UIViewController!) {
        present(viewController, animated: true, completion: nil)
    }
    
    func sign(_ signIn: GIDSignIn!, dismiss viewController: UIViewController!) {
        dismiss(animated: true, completion: nil)
    }
    
}
