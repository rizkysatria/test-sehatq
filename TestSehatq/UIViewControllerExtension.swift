//
//  UIViewControllerExtension.swift
//  TestSehatq
//
//  Created by rizky satria on 06/07/21.
//

import UIKit

extension UINavigationController {
    
    func makeNavigationBarTransparent() {
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
    }
  
    func makeNavigationBarSolid() {
        navigationBar.setBackgroundImage(UINavigationBar.appearance().backgroundImage(for: .default), for: .default)
        navigationBar.shadowImage = UINavigationBar.appearance().shadowImage
        navigationBar.isTranslucent = false
        navigationBar.barTintColor = UINavigationBar.appearance().tintColor
    }
    
    func removeTitleBackButton() {
        if let topItem = self.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }
    }
    
}
