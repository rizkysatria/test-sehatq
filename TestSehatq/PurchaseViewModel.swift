//
//  PurchaseViewModel.swift
//  TestSehatq
//
//  Created by rizky satria on 06/07/21.
//

import Foundation
import RxSwift

class PurchaseViewModel {
    
    var rxEventLoadData: PublishSubject<Void> {
        return eventLoadData
    }
    
    private (set) var purchaseList: [PurchaseProductModel] = [PurchaseProductModel]()
    private let eventLoadData = PublishSubject<Void>()
    private let manageCart: ManageCartProtocol!
    private let disposeBag = DisposeBag()
    
    init(manageCart: ManageCartProtocol) {
        self.manageCart = manageCart
    }
    
    func viewDidLoad() {
        getAllCart()
    }
    
    private func getAllCart() {
        manageCart.getAllProduct()
            .subscribe(onSuccess: { [weak self] purchaseProductModels in
                guard let weakSelf = self else { return }
                weakSelf.purchaseList = purchaseProductModels
                weakSelf.eventLoadData.onNext(())
        }).disposed(by: disposeBag)
    }
    
}
