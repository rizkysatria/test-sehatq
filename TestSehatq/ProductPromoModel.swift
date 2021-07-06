//
//  ProductPromoModel.swift
//  TestSehatq
//
//  Created by rizky satria on 05/07/21.
//

import Foundation
import ObjectMapper

class ProductPromoModel : Mappable {
    var id : String = ""
    var imageUrl : String = ""
    var title : String = ""
    var description : String = ""
    var price : String = ""
    var loved : Int = 0
    
    init() {}

    required init?(map: Map) { }

    func mapping(map: Map) {
        id <- map["id"]
        imageUrl <- map["imageUrl"]
        title <- map["title"]
        description <- map["description"]
        price <- map["price"]
        loved <- map["loved"]
    }
    
    static func toModel(productPromoEntities: ProductPromoEntities) -> ProductPromoModel {
        let productPromoModel = ProductPromoModel()
        productPromoModel.id = productPromoEntities.id
        productPromoModel.imageUrl = productPromoEntities.imageUrl
        productPromoModel.title = productPromoEntities.title
        productPromoModel.description = productPromoEntities.descriptionProduct
        productPromoModel.price = productPromoEntities.price
        productPromoModel.loved = productPromoEntities.loved
        return productPromoModel
    }
    
    static func toList(productPromoEntitiesList: [ProductPromoEntities]) -> [ProductPromoModel] {
        var productPromoModelList = [ProductPromoModel]()
        productPromoEntitiesList.forEach { productPromoEntities in
            let productPromoModel = ProductPromoModel()
            productPromoModel.id = productPromoEntities.id
            productPromoModel.imageUrl = productPromoEntities.imageUrl
            productPromoModel.title = productPromoEntities.title
            productPromoModel.description = productPromoEntities.descriptionProduct
            productPromoModel.price = productPromoEntities.price
            productPromoModel.loved = productPromoEntities.loved
            productPromoModelList.append(productPromoModel)
        }
        return productPromoModelList
    }

}
