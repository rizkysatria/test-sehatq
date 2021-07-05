//
//  StoryboardAssembly.swift
//  TestSehatq
//
//  Created by rizky satria on 05/07/21.
//

import Foundation
import SwinjectStoryboard
import Swinject

class StoryboardAssembly: Assembly {
    
    func assemble(container: Container) {

        container.storyboardInitCompleted(MainViewController.self) { r, c in
        }
        
    }
    
}
