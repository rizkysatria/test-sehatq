//
//  ManageCart.swift
//  TestSehatq
//
//  Created by rizky satria on 06/07/21.
//

import Foundation
import RxSwift

protocol ManageCartProtocol {
    func saveProduct(id: String)
    func getAllProduct() -> Single<[PurchaseProductModel]>
}

class ManageCart: ManageCartProtocol {
    
    private let productPromo: ProductPromoStorageProtocol!
    private let userDefaultStorage: UserDefaultStorageProtocol!
    
    init(productPromo: ProductPromoStorageProtocol, userDefaultStorage: UserDefaultStorageProtocol) {
        self.productPromo = productPromo
        self.userDefaultStorage = userDefaultStorage
    }
    
    func saveProduct(id: String) {
        userDefaultStorage.saveProductId(productId: id)
    }
    
    func getAllProduct() -> Single<[PurchaseProductModel]> {
        let listOfProduct = userDefaultStorage.getListProductId()
        var purchaseProductModels = [PurchaseProductModel]()
        listOfProduct.forEach { id in
            if let product = productPromo.getProductPromo(id: id) {
                purchaseProductModels.append(PurchaseProductModel.create(productPromoEntities: product))
            }
        }
        
        return Single.just(purchaseProductModels)
    }
}
