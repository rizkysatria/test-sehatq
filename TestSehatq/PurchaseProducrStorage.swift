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
    func clear()
}

class PurchaseProducrStorage: RealmConfig, PurchaseProducrStorageProtocol {
    
    func save(purchaseProduct: PurchaseProductEntities) {
        try! realm.write {
            realm.add(purchaseProduct, update: .all)
        }
    }
    
    func getPurchaseProduct(id: String) -> PurchaseProductEntities? {
        return realm.objects(PurchaseProductEntities.self).filter("id = '\(id)'").first
    }
    
    func clear() {
        try! realm.write {
            realm.delete(realm.objects(PurchaseProductEntities.self))
        }
    }
    
}
