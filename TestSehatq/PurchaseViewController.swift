//
//  PurchaseViewController.swift
//  TestSehatq
//
//  Created by rizky satria on 06/07/21.
//

import UIKit
import RxSwift

class PurchaseViewController: UIViewController {
    
    class func create() -> UIViewController {
        return Utility.getViewControllerFromStoryboard("PurchaseViewController", storyboardName: "Purchase")
    }
    
    @IBOutlet weak var tableview: UITableView!
    
    var purchaseViewModel: PurchaseViewModel!
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
        purchaseViewModel.viewDidLoad()
        registerCell()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        title = "Purchase History"
        navigationController?.makeNavigationBarSolid()
    }
    
    private func setupViewModel() {
        
        purchaseViewModel.rxEventLoadData
            .subscribe(onNext: { [weak self] in
                self?.tableview.reloadData()
        }).disposed(by: disposeBag)
        
    }
    
    private func registerCell() {
        tableview.register(ListTableViewCell.nib(), forCellReuseIdentifier: ListTableViewCell.cellReuseIdentifier())
    }
    
    private func showProductDetails(id: String) {
        let productDetailVC = ProductDetailViewController.create()
        productDetailVC.setProductId(productId: id)
        navigationController?.pushViewController(productDetailVC, animated: true)
    }
    
}

extension PurchaseViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return purchaseViewModel.purchaseList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.cellReuseIdentifier(), for: indexPath) as! ListTableViewCell
        let data = purchaseViewModel.purchaseList[indexPath.row]
        cell.setupUI(imgUrl: data.imageUrl, name: data.title, price: data.price)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showProductDetails(id: purchaseViewModel.purchaseList[indexPath.row].id)
    }
    
    
}
