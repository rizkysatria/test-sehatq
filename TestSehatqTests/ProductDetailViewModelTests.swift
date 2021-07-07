//
//  ProductDetailViewModelTests.swift
//  TestSehatqTests
//
//  Created by rizky satria on 07/07/21.
//

import XCTest
import RxSwift
@testable import TestSehatq

class ProductDetailViewModelTests: XCTestCase {
    
    private var productDetailViewModel: ProductDetailViewModel!
    private let disposeBag = DisposeBag()

    override func setUp() {
        super.setUp()
        let productApiService =  ProductApiService(apiClientServices: ApiClientServices())
        let displayProduct = DisplayProduct(productApi: productApiService, productStorage: ProductPromoStorage(), categoryStorage: CategoryStorage())
        let manageCart = ManageCart(productPromo: ProductPromoStorage(), userDefaultStorage: UserDefaultStorage())
        productDetailViewModel = ProductDetailViewModel(displayProduct: displayProduct, manageCart: manageCart)
        
    }
    
    override func tearDown() {
        super.tearDown()
        productDetailViewModel = nil
    }
    
    func testGetProductDetail() {
        productDetailViewModel.setProductId(productId: "6723")
        productDetailViewModel.viewDidLoad()
        XCTAssertEqual(productDetailViewModel.productPromo.id, "6723", "product id must be same")
        XCTAssertEqual(productDetailViewModel.productPromo.title, "Nitendo Switch", "title must be same")
        XCTAssertEqual(productDetailViewModel.productPromo.price, "$340", "price must be same")
        XCTAssertEqual(productDetailViewModel.productPromo.loved, 0, "loved must be same")
    }
    
    func testTapLikeButton() {
        productDetailViewModel.setProductId(productId: "6723")
        productDetailViewModel.viewDidLoad()
        productDetailViewModel.onTapLikeButton()
        XCTAssertEqual(productDetailViewModel.isLike, true, "isLike must be TRUE")
    }
    
    func testAddToCard() {
        productDetailViewModel.setProductId(productId: "6723")
        productDetailViewModel.viewDidLoad()
        
        productDetailViewModel.rxEventSuccessAddToCart
            .subscribe(onNext: {
                XCTAssertTrue(true, "event success must be call")
        }).disposed(by: disposeBag)
        
        productDetailViewModel.onTapBuyButton()
    }

}
