//
//  ProductApiService.swift
//  TestSehatq
//
//  Created by rizky satria on 05/07/21.
//

import Foundation
import RxSwift
import ObjectMapper

protocol ProductApiServiceProtocol {
    func getProductList() -> Single<ProductListModel>
}

class ProductApiService:ProductApiServiceProtocol {
    
    let apiClientServices: ApiClientServicesProtocol!
    let disposeBag = DisposeBag()
    
    init(apiClientServices: ApiClientServicesProtocol) {
        self.apiClientServices = apiClientServices
    }
    
    func getProductList() -> Single<ProductListModel> {
        return apiClientServices.getString().map { (isSuccess, response) in
            print(response)
            return Mapper<ProductListModel>().mapArray(JSONString: response)?.first ?? ProductListModel()
        }
    }
    
}
