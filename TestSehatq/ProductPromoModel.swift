//
//  ProductPromoModel.swift
//  TestSehatq
//
//  Created by rizky satria on 05/07/21.
//

import Foundation
import ObjectMapper

struct ProductPromo : Mappable {
    var id : String?
    var imageUrl : String?
    var title : String?
    var description : String?
    var price : String?
    var loved : Int?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        id <- map["id"]
        imageUrl <- map["imageUrl"]
        title <- map["title"]
        description <- map["description"]
        price <- map["price"]
        loved <- map["loved"]
    }

}
