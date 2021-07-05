//
//  ProductModel.swift
//  TestSehatq
//
//  Created by rizky satria on 05/07/21.
//

import Foundation
import ObjectMapper

struct ProductModel : Mappable {
    var category : [Category]?
    var productPromo : [ProductPromo]?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        category <- map["category"]
        productPromo <- map["productPromo"]
    }

}

