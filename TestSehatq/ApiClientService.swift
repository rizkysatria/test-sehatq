//
//  ApiClientService.swift
//  TestSehatq
//
//  Created by rizky satria on 05/07/21.
//

import Foundation
import RxSwift
import Alamofire

protocol ApiClientServicesProtocol {
    func getString() -> Single<(Bool, String)>
}

class ApiClientServices: ApiClientServicesProtocol {
    
    private var httpMethod: HTTPMethod = .get
    private let baseURL: String = "https://private-4639ce-ecommerce56.apiary-mock.com/home"
    
    func getString() -> Single<(Bool, String)> {
        return doRequest(method: .get)
    }
    
    private func doRequest(method: HTTPMethod) -> Single<(Bool, String)> {
        let completedURL = URL(string: baseURL)
        return Single.create { single in
            guard let completedURL = completedURL else { return Disposables.create() }
            AF.request(completedURL, method: method)
                .responseString { response in
                    switch response.result {
                    case .success(let json):
                        single(.success((true, json)))
                    case .failure(let error):
                        single(.failure(error))
                    }
            }
            return Disposables.create()
        }
    }
    
    
    
    
}
