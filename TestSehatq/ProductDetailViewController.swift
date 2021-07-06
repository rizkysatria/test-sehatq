//
//  ProductDetailViewController.swift
//  TestSehatq
//
//  Created by rizky satria on 06/07/21.
//

import UIKit
import RxSwift

class ProductDetailViewController: UIViewController {
    
    class func create() -> ProductDetailViewController {
        return Utility.getViewControllerFromStoryboard("ProductDetailViewController", storyboardName: "ProductDetails") as! ProductDetailViewController
    }
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    
    var productDetailViewModel: ProductDetailViewModel!
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
        productDetailViewModel.viewDidLoad()
        setupButton()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }
    
    func setProductId(productId: String) {
        productDetailViewModel.setProductId(productId: productId)
    }
    
    private func setupViewModel() {
        productDetailViewModel.rxEventLoadData
            .subscribe(onNext: { [weak self] in
                self?.updateUI()
        }).disposed(by: disposeBag)
    }
    
    private func updateUI() {
        let data = productDetailViewModel.productPromo
        productImage.loadUrl(data.imageUrl)
        productNameLabel.text = data.title
        productDescriptionLabel.text = data.description
        productPriceLabel.text = data.price
    }
    
    private func setupButton() {
        buyButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.productDetailViewModel.onTapBuyButton()
        }).disposed(by: disposeBag)
    }
    
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }
    
}
