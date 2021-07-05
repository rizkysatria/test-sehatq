//
//  CategoryStorage.swift
//  TestSehatq
//
//  Created by rizky satria on 05/07/21.
//

import Foundation
import RealmSwift

protocol CategoryStorageProtocol {
    func save(categories: [CategoryEntities])
    func getCategories() -> [CategoryEntities]
    func clear()
}

class CategoryStorage: RealmConfig, CategoryStorageProtocol {
    
    func save(categories: [CategoryEntities]) {
        try! realm.write {
            realm.add(categories, update: .all)
        }
    }
    
    func getCategories() -> [CategoryEntities] {
        return Array(realm.objects(CategoryEntities.self))
    }
    
    func clear() {
        try! realm.write {
            realm.delete(realm.objects(CategoryEntities.self))
        }
    }
    
}
