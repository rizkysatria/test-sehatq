//
//  ProductPromoEntities.swift
//  TestSehatq
//
//  Created by rizky satria on 05/07/21.
//

import Foundation
import RealmSwift

class ProductPromoEntities: Object {
    @objc dynamic var id : String = ""
    @objc dynamic var imageUrl : String = ""
    @objc dynamic var title : String = ""
    @objc dynamic var descriptionProduct : String = ""
    @objc dynamic var price : String = ""
    @objc dynamic var loved : Int = 0
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    static func toList(productPromoModels: [ProductPromoModel]) -> [ProductPromoEntities] {
        var productPromoEntitiesList = [ProductPromoEntities]()
        productPromoModels.forEach { productPromoModel in
            let productPromoEntities = ProductPromoEntities()
            productPromoEntities.id = productPromoModel.id ?? ""
            productPromoEntities.imageUrl = productPromoModel.imageUrl ?? ""
            productPromoEntities.title = productPromoModel.title ?? ""
            productPromoEntities.descriptionProduct = productPromoModel.description ?? ""
            productPromoEntities.price = productPromoModel.price ?? ""
            productPromoEntities.loved = productPromoModel.loved ?? 0
            productPromoEntitiesList.append(productPromoEntities)
        }
        return productPromoEntitiesList
    }
    
}
