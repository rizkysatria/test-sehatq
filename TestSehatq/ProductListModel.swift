//
//  ProductListModel.swift
//  TestSehatq
//
//  Created by rizky satria on 05/07/21.
//

import Foundation
import ObjectMapper

class ProductListModel : Mappable {
    var data : ProductModel?
    
    init() {}

    required init?(map: Map) {
        
    }

    func mapping(map: Map) {
        data <- map["data"]
    }

}
