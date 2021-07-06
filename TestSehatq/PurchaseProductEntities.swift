//
//  PurchaseProductEntities.swift
//  TestSehatq
//
//  Created by rizky satria on 05/07/21.
//

import Foundation
import RealmSwift

class PurchaseProductEntities: Object {
    @objc dynamic var id : String = ""
    @objc dynamic var imageUrl : String = ""
    @objc dynamic var title : String = ""
    @objc dynamic var price : String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    static func toEntities(productPromo: ProductPromoEntities) -> PurchaseProductEntities {
        let purchaseProductEntities = PurchaseProductEntities()
        purchaseProductEntities.id = productPromo.id
        purchaseProductEntities.title = productPromo.title
        purchaseProductEntities.imageUrl = productPromo.imageUrl
        purchaseProductEntities.price = productPromo.price
        return purchaseProductEntities
    }
    
}
