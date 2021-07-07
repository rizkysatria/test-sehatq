//
//  HomeViewModelTests.swift
//  TestSehatqTests
//
//  Created by rizky satria on 07/07/21.
//

import XCTest
@testable import TestSehatq

class HomeViewModelTests: XCTestCase {
    
    private var homeViewModel: HomeViewModel!
    
    override func setUp() {
        super.setUp()
        let productApiService = ProductApiService(apiClientServices: ApiClientServices())
        let displayProductProtocol = DisplayProduct(productApi: productApiService, productStorage: ProductPromoStorage(), categoryStorage: CategoryStorage())
        homeViewModel = HomeViewModel(displayProduct: displayProductProtocol)
    }
    
    override func tearDown() {
        super.tearDown()
        homeViewModel = nil
    }
    
    func testCheckCategoryListDataAvailable() {
        homeViewModel.viewDidLoad()
        XCTAssertTrue(homeViewModel.categoryList.count == 5, "category list length must be 5")
    }
    
    func testCheckProductListDataAvailable() {
        homeViewModel.viewDidLoad()
        XCTAssertTrue(homeViewModel.productList.count == 4, "category list length must be 5")
    }
    
    

}
