//
//  CartViewController.swift
//  TestSehatq
//
//  Created by rizky satria on 05/07/21.
//

import UIKit

class CartViewController: UIViewController {
    
    class func create() -> CartViewController {
        return Utility.getViewControllerFromStoryboard("CartViewController", storyboardName: "Cart") as! CartViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
