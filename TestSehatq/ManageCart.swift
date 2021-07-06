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
    
    private let purchaseProduct: PurchaseProductStorageProtocol!
    private let productPromo: ProductPromoStorageProtocol!
    
    init(purchaseProduct: PurchaseProductStorageProtocol, productPromo: ProductPromoStorageProtocol) {
        self.purchaseProduct = purchaseProduct
        self.productPromo = productPromo
    }
    
    func saveProduct(id: String) {
        if let product = productPromo.getProductPromo(id: id) {
            let entities = PurchaseProductEntities.toEntities(productPromo: product)
            purchaseProduct.save(purchaseProduct: entities)
        }
    }
    
    func getAllProduct() -> Single<[PurchaseProductModel]> {
        return Single.just(PurchaseProductModel.toList(purchaseProductEntities: purchaseProduct.getPurchaseProducts()))
    }
}
