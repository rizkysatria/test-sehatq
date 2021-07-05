//
//  ProductModel.swift
//  TestSehatq
//
//  Created by rizky satria on 05/07/21.
//

import Foundation
import ObjectMapper

class ProductModel : Mappable {
    var category : [CategoryModel] = [CategoryModel]()
    var productPromo : [ProductPromoModel] = [ProductPromoModel]()
    
    init() {}

    required init?(map: Map) {}

    func mapping(map: Map) {
        category <- map["category"]
        productPromo <- map["productPromo"]
    }

}

