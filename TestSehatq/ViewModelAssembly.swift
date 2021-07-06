//
//  ViewModelAssembly.swift
//  TestSehatq
//
//  Created by rizky satria on 05/07/21.
//

import Foundation
import Swinject

class ViewModelAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(HomeViewModel.self) { r in
            HomeViewModel(displayProduct: r.resolve(DisplayProductProtocol.self)!)
        }
        
        container.register(SearchViewModel.self) { r in
            SearchViewModel(displayProduct: r.resolve(DisplayProductProtocol.self)!)
        }
        
        container.register(ProductDetailViewModel.self) { r in
            ProductDetailViewModel(displayProduct: r.resolve(DisplayProductProtocol.self)!,
                                   manageCart: r.resolve(ManageCartProtocol.self)!)
        }
        
        container.register(PurchaseViewModel.self) { r in
            PurchaseViewModel(manageCart: r.resolve(ManageCartProtocol.self)!)
        }
        
    }
}
