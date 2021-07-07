//
//  UsecaseAssembly.swift
//  TestSehatq
//
//  Created by rizky satria on 05/07/21.
//

import Foundation
import Swinject

class UsecaseAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(DisplayProductProtocol.self) { r in
            DisplayProduct(productApi: r.resolve(ProductApiServiceProtocol.self)!,
                           productStorage: r.resolve(ProductPromoStorageProtocol.self)!,
                           categoryStorage: r.resolve(CategoryStorageProtocol.self)!)
        }
        
        container.register(ManageCartProtocol.self) { r in
            ManageCart(productPromo: r.resolve(ProductPromoStorageProtocol.self)!,
                       userDefaultStorage: r.resolve(UserDefaultStorageProtocol.self)!)
        }
        
    }
}
