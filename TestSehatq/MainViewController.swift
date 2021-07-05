//
//  MainViewController.swift
//  TestSehatq
//
//  Created by rizky satria on 05/07/21.
//

import UIKit
import RxSwift

class MainViewController: UITabBarController {
    
    private let disposeBag: DisposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addTabbarItems()
    }
    
    private func addTabbarItems() {
        let homeVC = HomeViewController.create()
        let homeTabbarItem = UITabBarItem(title: "Home", image: nil, tag: 0)
        homeTabbarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -16)
        
        let feedVC = FeedViewController.create()
        let feedTabbarItem = UITabBarItem(title: "Feed", image: nil, tag: 0)
        feedTabbarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -16)
        
        let cartVC = CartViewController.create()
        let cartTabbarItem = UITabBarItem(title: "Cart", image: nil, tag: 0)
        cartTabbarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -16)
        
        let profileVC = ProfileViewController.create()
        let profileTabbarItem = UITabBarItem(title: "Profile", image: nil, tag: 0)
        profileTabbarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -16)
        
        homeVC.tabBarItem = homeTabbarItem
        feedVC.tabBarItem = feedTabbarItem
        cartVC.tabBarItem = cartTabbarItem
        profileVC.tabBarItem = profileTabbarItem
        
        let listOfViewControllers: [UIViewController] = [homeVC, feedVC, cartVC, profileVC]
        
        viewControllers = listOfViewControllers
    }


}

