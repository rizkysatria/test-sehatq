//
//  StorageAssembly.swift
//  TestSehatq
//
//  Created by rizky satria on 05/07/21.
//

import Foundation
import Swinject

class StorageAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(CategoryStorageProtocol.self) { r in
            CategoryStorage()
        }
        
        container.register(ProductPromoStorageProtocol.self) { r in
            ProductPromoStorage()
        }
        
        container.register(PurchaseProductStorageProtocol.self) { r in
            PurchaseProductStorage()
        }
        
    }
}
