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
}
