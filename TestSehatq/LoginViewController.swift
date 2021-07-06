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
    
    @IBOutlet weak var loginWithFBButton: UIButton!
    @IBOutlet weak var loginWithGoogleButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginContainerView: UIView!
    @IBOutlet weak var rememberMeButton: UIButton!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var loginViewModel: LoginViewModel!
    
    private let loginManager = LoginManager()
    private let disposeBag = DisposeBag()
    
    class func create() -> LoginViewController {
        return Utility.getViewControllerFromStoryboard("LoginViewController", storyboardName: "Login") as! LoginViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
        setupButtons()
        setupGoogleSignIn()
        setupLayerComponent()
        updateUIRememberMeButton()
        setupTextFields()
    }
    
    private func setupButtons() {
        
        loginWithFBButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.connectToFacebook()
        }).disposed(by: disposeBag)
        
        loginWithGoogleButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.connectToGoogle()
        }).disposed(by: disposeBag)
        
        rememberMeButton.rx.tap
            .subscribe(onNext: { [weak self] in
                guard let weakSelf = self else { return }
                weakSelf.loginViewModel.setActiveRememberMe(isActive: !weakSelf.loginViewModel.isRememberMeActive)
                weakSelf.updateUIRememberMeButton()
        }).disposed(by: disposeBag)
        
        loginButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.loginViewModel.onTapLoginButton()
        }).disposed(by: disposeBag)
        
    }
    
    private func setupViewModel() {
        loginViewModel.rxEventSuccessLogin
            .subscribe(onNext: { [weak self] in
                self?.showMainScreen()
        }).disposed(by: disposeBag)
    }
    
    private func connectToFacebook() {
        loginViewModel.facebookSignIn(delegate: self)
    }
    
    private func setupGoogleSignIn() {
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance()?.presentingViewController = self
    }
    
    private func connectToGoogle() {
        GIDSignIn.sharedInstance().signOut()
        GIDSignIn.sharedInstance().signIn()
    }
    
    private func showMainScreen() {
        let mainVC = MainViewController.create()
        UIApplication.shared.windows.first?.rootViewController = mainVC
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    private func setupLayerComponent() {
        loginContainerView.layer.borderWidth = 1
        loginContainerView.layer.borderColor = UIColor.lightGray.cgColor
        loginContainerView.layer.cornerRadius = 8
        
        loginWithFBButton.layer.cornerRadius = 8
        loginWithGoogleButton.layer.cornerRadius = 8
        loginButton.layer.cornerRadius = 8
    }
    
    private func updateUIRememberMeButton() {
        rememberMeButton.setBackgroundImage(UIImage(systemName: loginViewModel.isRememberMeActive ? "checkmark.square" : "square"), for: .normal)
    }
    
    private func setupTextFields() {
        let userNameBindToUI = loginViewModel.userName.asObservable()
            .bind(to: userNameTextField.rx.text)
        let _ = userNameTextField.rx.text
            .subscribe(onNext: { [weak self] value in
                if let value = value {
                    self?.loginViewModel.userName.accept(value)
                }
            }, onCompleted:  {
                userNameBindToUI.dispose()
            })
        
        let passwordBindToUI = loginViewModel.password.asObservable()
            .bind(to: passwordTextField.rx.text)
        let _ = passwordTextField.rx.text
            .subscribe(onNext: { [weak self] value in
                if let value = value {
                    self?.loginViewModel.password.accept(value)
                }
            }, onCompleted:  {
                passwordBindToUI.dispose()
            })
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
