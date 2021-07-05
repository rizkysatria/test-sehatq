//
//  DisplayProduct.swift
//  TestSehatq
//
//  Created by rizky satria on 05/07/21.
//

import Foundation
import RxSwift

protocol DisplayProductProtocol {
    func getProductList() -> Single<ProductModel>
}

class DisplayProduct: DisplayProductProtocol {
    
    private let productApi: ProductApiServiceProtocol!
    
    init(productApi: ProductApiServiceProtocol) {
        self.productApi = productApi
    }
    
    func getProductList() -> Single<ProductModel> {
        return productApi.getProductList().map { productListModel in
            return productListModel.data ?? ProductModel()
        }
    }
    
}
