//
//  GetProductListApi.swift
//  TestSehatq
//
//  Created by rizky satria on 05/07/21.
//

import Foundation
import RxSwift
import ObjectMapper

protocol GetProductListApiProtocol {
    func getProductList() -> Single<ProductListModel>
}

class GetProductListApi: GetProductListApiProtocol {
    
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
