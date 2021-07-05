//
//  HomeViewModel.swift
//  TestSehatq
//
//  Created by rizky satria on 05/07/21.
//

import Foundation
import RxSwift

class HomeViewModel {
    
    var rxEventLoadData: PublishSubject<Void> {
        return eventLoadData
    }
    
    private (set) var categoryList: [CategoryModel] = [CategoryModel]()
    private (set) var productList: [ProductPromoModel] = [ProductPromoModel]()
    
    private let eventLoadData = PublishSubject<Void>()
    
    private let displayProduct: DisplayProductProtocol!
    
    private let disposeBag = DisposeBag()
    
    init(displayProduct: DisplayProductProtocol) {
        self.displayProduct = displayProduct
    }
    
    func viewDidLoad() {
        displayProduct.getProductList()
            .subscribe(onSuccess: { [weak self] productModel in
                guard let weakSelf = self else { return }
                weakSelf.productList = productModel.productPromo
                weakSelf.categoryList = productModel.category
                weakSelf.eventLoadData.onNext(())
        }).disposed(by: disposeBag)
    }
    
}
