//
//  ProfileViewController.swift
//  TestSehatq
//
//  Created by rizky satria on 05/07/21.
//

import UIKit

class ProfileViewController: UIViewController {
    
    class func create() -> ProfileViewController {
        return Utility.getViewControllerFromStoryboard("ProfileViewController", storyboardName: "Profile") as! ProfileViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
