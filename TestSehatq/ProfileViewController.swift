//
//  ProfileViewController.swift
//  TestSehatq
//
//  Created by rizky satria on 05/07/21.
//

import UIKit

class ProfileViewController: UIViewController {
    
    class func create() -> ProfileViewController {
        return Utility.getViewControllerFromStoryboard(Constant.PROFILE_CONTROLLER_IDENTIFIER, storyboardName: Constant.PROFILE_STORYBOARD_NAME) as! ProfileViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
