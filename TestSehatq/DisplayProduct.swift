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
    func getAllProductPromo() -> Single<[ProductPromoModel]>
    func getProductPromo(id: String) -> Single<ProductPromoModel>
}

class DisplayProduct: DisplayProductProtocol {
    
    private let productApi: ProductApiServiceProtocol!
    private let productStorage: ProductPromoStorageProtocol!
    private let categoryStorage: CategoryStorageProtocol!
    
    init(productApi: ProductApiServiceProtocol, productStorage: ProductPromoStorageProtocol, categoryStorage: CategoryStorageProtocol) {
        self.productApi = productApi
        self.productStorage = productStorage
        self.categoryStorage = categoryStorage
    }
    
    func getProductList() -> Single<ProductModel> {
        return productApi.getProductList().map { [weak self] productListModel in
            guard let weakSelf = self, let data = productListModel.data else { return ProductModel() }
            weakSelf.categoryStorage.clear()
            weakSelf.categoryStorage.save(categories: CategoryEntities.toList(categoryModels: data.category))
            weakSelf.productStorage.clear()
            weakSelf.productStorage.save(productPromos: ProductPromoEntities.toList(productPromoModels: data.productPromo))
            return productListModel.data ?? ProductModel()
        }
    }
    
    func getAllCategories() -> Single<[CategoryModel]> {
        return Single.just(CategoryModel.toList(categoryListEntity: categoryStorage.getCategories()))
    }
    
    func getAllProductPromo() -> Single<[ProductPromoModel]> {
        return Single.just(ProductPromoModel.toList(productPromoEntitiesList: productStorage.getProductPromos()))
    }
    
    func getProductPromo(id: String) -> Single<ProductPromoModel> {
        if let dataFromCache = productStorage.getProductPromo(id: id)  {
            return Single.just(ProductPromoModel.toModel(productPromoEntities: dataFromCache))
        }
        return Single.just(ProductPromoModel())
    }
    
}
