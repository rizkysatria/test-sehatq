//
//  HomeViewController.swift
//  TestSehatq
//
//  Created by rizky satria on 05/07/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    class func create() -> HomeViewController {
        return Utility.getViewControllerFromStoryboard("HomeViewController", storyboardName: "Home") as! HomeViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
