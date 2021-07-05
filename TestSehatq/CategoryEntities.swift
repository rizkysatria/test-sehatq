//
//  CategoryEntities.swift
//  TestSehatq
//
//  Created by rizky satria on 05/07/21.
//

import Foundation
import RealmSwift

class CategoryEntities: Object {
    @objc dynamic var imageUrl : String = ""
    @objc dynamic var id : Int = 0
    @objc dynamic var name : String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    static func toList(categoryModels: [CategoryModel]) -> [CategoryEntities] {
        var categoryEntitiesList = [CategoryEntities]()
        categoryModels.forEach { categoryModel in
            let categoryEntities = CategoryEntities()
            categoryEntities.id = categoryModel.id ?? 0
            categoryEntities.name = categoryModel.name ?? ""
            categoryEntities.imageUrl = categoryModel.imageUrl ?? ""
            categoryEntitiesList.append(categoryEntities)
        }
        return categoryEntitiesList
    }
}
