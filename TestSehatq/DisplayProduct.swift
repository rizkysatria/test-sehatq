//
//  DisplayProduct.swift
//  TestSehatq
//
//  Created by rizky satria on 05/07/21.
//

import Foundation
import RxSwift

protocol DisplayProductProtocol {
    func getAllData() -> Single<(categories: [CategoryModel], productPromo: [ProductPromoModel])>
    func getProductPromo(id: String) -> Single<ProductPromoModel>
    func getAllProductPromo() -> Single<[ProductPromoModel]>

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
    
    func getAllData() -> Single<(categories: [CategoryModel], productPromo: [ProductPromoModel])> {
        let categoryFromCache = CategoryModel.toList(categoryListEntity: categoryStorage.getCategories())
        let productPromoFromCache = ProductPromoModel.toList(productPromoEntitiesList: productStorage.getProductPromos())
        if !categoryFromCache.isEmpty && !productPromoFromCache.isEmpty {
            return Single.just((categoryFromCache, productPromoFromCache))
        } else {
            return getAllDataFromServer()
        }
    }
    
    func getProductPromo(id: String) -> Single<ProductPromoModel> {
        if let dataFromCache = productStorage.getProductPromo(id: id)  {
            return Single.just(ProductPromoModel.toModel(productPromoEntities: dataFromCache))
        }
        return Single.just(ProductPromoModel())
    }
    
    func getAllProductPromo() -> Single<[ProductPromoModel]> {
        return Single.just(ProductPromoModel.toList(productPromoEntitiesList: productStorage.getProductPromos()))
    }
    
    private func getAllDataFromServer() -> Single<(categories: [CategoryModel], productPromo: [ProductPromoModel])> {
        return productApi.getProductList().map { [weak self] productListModel in
            guard let weakSelf = self, let data = productListModel.data else { return ([CategoryModel](),[ProductPromoModel]()) }
            weakSelf.categoryStorage.clear()
            weakSelf.categoryStorage.save(categories: CategoryEntities.toList(categoryModels: data.category))
            weakSelf.productStorage.clear()
            weakSelf.productStorage.save(productPromos: ProductPromoEntities.toList(productPromoModels: data.productPromo))
            return (data.category, data.productPromo)
        }
    }
    
}
