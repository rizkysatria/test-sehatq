//
//  CategoryModel.swift
//  TestSehatq
//
//  Created by rizky satria on 05/07/21.
//

import Foundation
import ObjectMapper

class CategoryModel : Mappable {
    var imageUrl : String?
    var id : Int?
    var name : String?

    required init?(map: Map) {

    }

    func mapping(map: Map) {
        imageUrl <- map["imageUrl"]
        id <- map["id"]
        name <- map["name"]
    }

}
