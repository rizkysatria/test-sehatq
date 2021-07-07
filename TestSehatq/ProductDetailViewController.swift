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
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeImage: UIImageView!
    
    var productDetailViewModel: ProductDetailViewModel!
    
    private var shareButton: UIButton?
    private var shareBarButtonItem = UIBarButtonItem()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSearchBarItem()
        setupViewModel()
        productDetailViewModel.viewDidLoad()
        setupButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.makeNavigationBarSolid()
    }
    
    func setProductId(productId: String) {
        productDetailViewModel.setProductId(productId: productId)
    }
    
    private func setupViewModel() {
        productDetailViewModel.rxEventLoadData
            .subscribe(onNext: { [weak self] in
                self?.updateUI()
        }).disposed(by: disposeBag)
        
        productDetailViewModel.rxEventSuccessAddToCart
            .subscribe(onNext: { _ in
                Utility.showAlertCart()
        }).disposed(by: disposeBag)
    }
    
    private func updateUI() {
        let data = productDetailViewModel.productPromo
        productImage.loadUrl(data.imageUrl)
        productNameLabel.text = data.title
        productDescriptionLabel.text = data.description
        productPriceLabel.text = data.price
        updateLikeImage()
    }
    
    private func setupButton() {
        buyButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.productDetailViewModel.onTapBuyButton()
        }).disposed(by: disposeBag)
        
        shareButton?.rx.tap
            .subscribe(onNext: { [weak self] in
                guard let weakSelf = self else { return }
                weakSelf.present(weakSelf.getShareUIActivityVC(), animated: true)
        }).disposed(by: disposeBag)
        
        likeButton.rx.tap
            .subscribe(onNext: { [weak self] in
                guard let weakSelf = self else { return }
                weakSelf.productDetailViewModel.onTapLikeButton()
                weakSelf.updateLikeImage()
        }).disposed(by: disposeBag)
    }
    
    private func setupNavigationBar() {
        navigationController?.isNavigationBarHidden = false
        navigationController?.makeNavigationBarTransparent()
        navigationController?.removeTitleBackButton()
    }
    
    private func setSearchBarItem() {
        let shareImage: UIImage = UIImage(named:"ico_share")!
        shareButton = UIButton(type: .custom)
        shareButton!.frame = CGRect(x: 0, y: 0, width: 35, height: 48)
        shareButton!.setImage(shareImage, for: .normal)
        shareBarButtonItem = UIBarButtonItem(customView: shareButton!)
        navigationItem.rightBarButtonItem = shareBarButtonItem
    }
    
    private func getShareUIActivityVC() -> UIActivityViewController {
        var sharingItems = [AnyObject]()
        
        if let sharingURL = NSURL(string: "https://www.google.com/") {
            sharingItems.append(sharingURL)
        }
        
        let uiActivityViewController = UIActivityViewController(activityItems: sharingItems, applicationActivities: nil)
        uiActivityViewController.excludedActivityTypes = [UIActivity.ActivityType.openInIBooks, UIActivity.ActivityType.assignToContact]
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            uiActivityViewController.modalPresentationStyle = .popover
            let popover = uiActivityViewController.popoverPresentationController
            popover?.barButtonItem = shareBarButtonItem
        }
        
        return uiActivityViewController
    }
    
    private func updateLikeImage() {
        likeImage.image = UIImage(named: productDetailViewModel.isLike ? "btnLikeOn" : "btnLikeOff")
    }
    
}
