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
    
    init() {}

    required init?(map: Map) {

    }

    func mapping(map: Map) {
        imageUrl <- map["imageUrl"]
        id <- map["id"]
        name <- map["name"]
    }
    
    static func toList(categoryListEntity: [CategoryEntities]) -> [CategoryModel] {
        var categoryListModel = [CategoryModel]()
        categoryListEntity.forEach { categoryEntities in
            let categoryModel = CategoryModel()
            categoryModel.id = categoryEntities.id
            categoryModel.name = categoryEntities.name
            categoryModel.imageUrl = categoryEntities.imageUrl
            categoryListModel.append(categoryModel)
        }
        return categoryListModel
    }
    
}
