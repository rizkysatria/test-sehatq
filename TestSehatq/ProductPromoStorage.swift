//
//  ProductPromoStorage.swift
//  TestSehatq
//
//  Created by rizky satria on 05/07/21.
//

import Foundation
import RealmSwift

protocol ProductPromoStorageProtocol {
    func save(productPromos: [ProductPromoEntities])
    func getProductPromos() -> [ProductPromoEntities]
    func getProductPromo(id: String) -> ProductPromoEntities?
    func clear()
}

class ProductPromoStorage: RealmConfig, ProductPromoStorageProtocol {
    
    func save(productPromos: [ProductPromoEntities]) {
        try! realm.write {
            realm.add(productPromos, update: .all)
        }
    }
    
    func getProductPromos() -> [ProductPromoEntities] {
        return Array(realm.objects(ProductPromoEntities.self))
    }
    
    func getProductPromo(id: String) -> ProductPromoEntities? {
        return realm.objects(ProductPromoEntities.self).filter("id = '\(id)'").first
    }
    
    func clear() {
        try! realm.write {
            realm.delete(realm.objects(ProductPromoEntities.self))
        }
    }
    
}
