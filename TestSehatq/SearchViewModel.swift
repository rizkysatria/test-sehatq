//
//  SearchViewModel.swift
//  TestSehatq
//
//  Created by rizky satria on 06/07/21.
//

import Foundation
import RxSwift
import RxCocoa

class SearchViewModel {
    
    var rxEventRefreshData : PublishSubject<Void> {
        return eventRefreshData
    }

    var searchQuery = BehaviorRelay<String>(value: "")
    
    private (set) var resultProductPromoList: [ProductPromoModel] = [ProductPromoModel]()
    private var productPromoList: [ProductPromoModel] = [ProductPromoModel]()
    
    private let eventRefreshData = PublishSubject<Void>()
    private let displayProduct: DisplayProductProtocol!
    private let disposeBag = DisposeBag()
    
    init(displayProduct: DisplayProductProtocol) {
        self.displayProduct = displayProduct
    }
    
    func viewDidLoad() {
        getProduct()
        setupSearchCityQuery()
    }
    
    private func getProduct() {
        displayProduct.getAllProductPromo()
            .subscribe(onSuccess: { [weak self] productPromoList in
                self?.productPromoList = productPromoList
        }).disposed(by: disposeBag)
    }
    
    private func setupSearchCityQuery() {
        searchQuery.asObservable()
            .debounce(.milliseconds(Int(500)), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .subscribe({ [weak self] _ in
                guard let weakSelf = self else { return }
                if weakSelf.searchQuery.value != "" {
                    let result = weakSelf.productPromoList.filter {
                        $0.title.lowercased().contains(weakSelf.searchQuery.value.lowercased())
                    }
                    weakSelf.resultProductPromoList = result
                }
                weakSelf.eventRefreshData.onNext(())
            }).disposed(by: disposeBag)
    }
    
}
