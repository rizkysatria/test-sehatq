//
//  PurchaseProducrStorage.swift
//  TestSehatq
//
//  Created by rizky satria on 05/07/21.
//

import Foundation
import RealmSwift

protocol PurchaseProducrStorageProtocol {
    func save(purchaseProduct: PurchaseProductEntities)
    func getPurchaseProduct(id: String) -> PurchaseProductEntities?
    func getPurchaseProducts() -> [PurchaseProductEntities]
    func clear()
}

class PurchaseProducrStorage: RealmConfig, PurchaseProducrStorageProtocol {
    
    func save(purchaseProduct: PurchaseProductEntities) {
        try! realm.write {
            realm.add(purchaseProduct)
        }
    }
    
    func getPurchaseProduct(id: String) -> PurchaseProductEntities? {
        return realm.objects(PurchaseProductEntities.self).filter("id = '\(id)'").first
    }
    
    func getPurchaseProducts() -> [PurchaseProductEntities] {
        return Array(realm.objects(PurchaseProductEntities.self))
    }
    
    func clear() {
        try! realm.write {
            realm.delete(realm.objects(PurchaseProductEntities.self))
        }
    }
    
}
