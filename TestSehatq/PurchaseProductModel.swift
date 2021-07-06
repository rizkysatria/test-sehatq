//
//  PurchaseProductModel.swift
//  TestSehatq
//
//  Created by rizky satria on 06/07/21.
//

import Foundation

class PurchaseProductModel {
    var id : String = ""
    var imageUrl : String = ""
    var title : String = ""
    var price : String = ""
    
    
    static func toList(purchaseProductEntities: [PurchaseProductEntities]) -> [PurchaseProductModel] {
        var purchaseProductModels = [PurchaseProductModel]()
        purchaseProductEntities.forEach { purchaseProductEntities in
            let purchaseProductModel = PurchaseProductModel()
            purchaseProductModel.id = purchaseProductEntities.id
            purchaseProductModel.title = purchaseProductEntities.title
            purchaseProductModel.imageUrl = purchaseProductEntities.imageUrl
            purchaseProductModel.price = purchaseProductEntities.price
            purchaseProductModels.append(purchaseProductModel)
        }
        return purchaseProductModels
        
    }
}
