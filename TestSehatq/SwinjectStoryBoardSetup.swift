//
//  SwinjectStoryBoardSetup.swift
//  TestSehatq
//
//  Created by rizky satria on 05/07/21.
//

import Foundation
import Swinject
import SwinjectStoryboard

extension SwinjectStoryboard {
    
    @objc class func setup() {
        Container.loggingFunction = nil
        _ = Assembler([
            StoryboardAssembly(),
            ViewModelAssembly(),
            UsecaseAssembly(),
            ApiAssembly()
            ],
            container: defaultContainer
        )
    }
}
