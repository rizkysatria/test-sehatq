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

        container.storyboardInitCompleted(HomeViewController.self) { r, c in
            c.homeViewModel = r.resolve(HomeViewModel.self)!
        }
        
        container.storyboardInitCompleted(SearchViewController.self) { r, c in
            c.searchViewModel = r.resolve(SearchViewModel.self)!
        }
        
        container.storyboardInitCompleted(ProductDetailViewController.self) { r, c in
            c.productDetailViewModel = r.resolve(ProductDetailViewModel.self)!
        }
        
    }
    
}
