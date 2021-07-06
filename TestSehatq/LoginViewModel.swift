//
//  LoginViewModel.swift
//  TestSehatq
//
//  Created by rizky satria on 06/07/21.
//

import Foundation
import GoogleSignIn

class LoginViewModel {
    
    init() {
        setupGoogleSignIn()
    }
    
    private func setupGoogleSignIn() {
        GIDSignIn.sharedInstance().clientID = "888957909995-pgjgkub9sqtshhb8u0fp3r9prablegqr.apps.googleusercontent.com"
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print("")
        } else if let serverAuthCode = user.serverAuthCode {
            print("")
        } else {
            print("")
        }
    }
       
}
