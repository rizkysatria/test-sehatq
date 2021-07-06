//
//  ProductDetailViewModel.swift
//  TestSehatq
//
//  Created by rizky satria on 06/07/21.
//

import Foundation
import RxSwift

class ProductDetailViewModel {
    
    var rxEventLoadData: PublishSubject<Void> {
        return eventLoadData
    }
    
    var rxEventSuccessAddToCart: PublishSubject<Void> {
        return eventSuccessAddToCart
    }
    
    private (set) var isLike: Bool = false
    private (set) var productPromo = ProductPromoModel()
    private var productId: String?
    
    private let eventLoadData = PublishSubject<Void>()
    private let eventSuccessAddToCart = PublishSubject<Void>()
    
    private let displayProduct: DisplayProductProtocol!
    private let manageCart: ManageCartProtocol!
    private let disposeBag = DisposeBag()
    
    init(displayProduct: DisplayProductProtocol, manageCart: ManageCartProtocol) {
        self.displayProduct = displayProduct
        self.manageCart = manageCart
    }
    
    func viewDidLoad() {
        getProductDetail()
    }
    
    func setProductId(productId: String) {
        self.productId = productId
    }
    
    func onTapBuyButton() {
        manageCart.saveProduct(id: productPromo.id)
        eventSuccessAddToCart.onNext(())
    }
    
    func onTapLikeButton() {
        isLike = !isLike
    }
    
    private func getProductDetail() {
        guard let productId = productId else { return }
        displayProduct.getProductPromo(id: productId)
            .subscribe(onSuccess: { [weak self] productPromo in
                guard let weakSelf = self else { return }
                weakSelf.productPromo = productPromo
                weakSelf.isLike = productPromo.loved > 0
                weakSelf.eventLoadData.onNext(())
        }).disposed(by: disposeBag)
    }
    
    
    
}
