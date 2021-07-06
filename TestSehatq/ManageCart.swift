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
    func getAllProduct() -> Single<[PurchaseProductEntities]>
}

class ManageCart: ManageCartProtocol {
    
    private let purchaseProduct: PurchaseProducrStorageProtocol!
    private let productPromo: ProductPromoStorageProtocol!
    
    init(purchaseProduct: PurchaseProducrStorageProtocol, productPromo: ProductPromoStorageProtocol) {
        self.purchaseProduct = purchaseProduct
        self.productPromo = productPromo
    }
    
    func saveProduct(id: String) {
        let getallProduct = productPromo.getProductPromos()
        if let product = productPromo.getProductPromo(id: id) {
            let entities = PurchaseProductEntities.toEntities(productPromo: product)
            purchaseProduct.save(purchaseProduct: entities)
        }
    }
    
    func getAllProduct() -> Single<[PurchaseProductEntities]> {
        return Single.just(purchaseProduct.getPurchaseProducts())
    }
}
