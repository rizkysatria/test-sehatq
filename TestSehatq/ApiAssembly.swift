//
//  ApiAssembly.swift
//  TestSehatq
//
//  Created by rizky satria on 05/07/21.
//

import Foundation
import Swinject

class ApiAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(ApiClientServicesProtocol.self) { r in
            ApiClientServices()
        }
        
        container.register(ProductApiServiceProtocol.self) { r in
            ProductApiService(apiClientServices: r.resolve(ApiClientServicesProtocol.self)!)
        }
        
    }
}
