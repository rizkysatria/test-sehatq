//
//  CategoryModel.swift
//  TestSehatq
//
//  Created by rizky satria on 05/07/21.
//

import Foundation
import ObjectMapper

struct Category : Mappable {
    var imageUrl : String?
    var id : Int?
    var name : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        imageUrl <- map["imageUrl"]
        id <- map["id"]
        name <- map["name"]
    }

}
