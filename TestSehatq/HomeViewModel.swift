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
        getData()
    }
    
    private func getData() {
        displayProduct.getAllData()
            .subscribe(onSuccess: { [weak self] categoryList, productPromoList in
                guard let weakSelf = self else { return }
                weakSelf.categoryList = categoryList
                weakSelf.productList = productPromoList
                weakSelf.eventLoadData.onNext(())
        }).disposed(by: disposeBag)
    }
    
}
