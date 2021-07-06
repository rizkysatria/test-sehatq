//
//  Utility.swift
//  TestSehatq
//
//  Created by rizky satria on 05/07/21.
//

import UIKit

class Utility {
    
    class func getViewControllerFromStoryboard(_ viewControllerID: String, storyboardName: String) -> UIViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: viewControllerID)
    }
    
    class func getScreenWidth() -> CGFloat {
        if UIScreen.main.bounds.width > UIScreen.main.bounds.height {
            return UIScreen.main.bounds.height
        }
        return UIScreen.main.bounds.width
    }
    
    class func showAlertCart() {
        let alertController = UIAlertController(title: "", message: "Add item to cart success !!", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        if let viewController = UIApplication.shared.windows.first?.rootViewController {
            viewController.present(alertController, animated: true, completion: nil)
        }
    }
    
}
