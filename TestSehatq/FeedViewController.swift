//
//  FeedViewController.swift
//  TestSehatq
//
//  Created by rizky satria on 05/07/21.
//

import UIKit

class FeedViewController: UIViewController {
    
    class func create() -> FeedViewController {
        return Utility.getViewControllerFromStoryboard("FeedViewController", storyboardName: "Feed") as! FeedViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
