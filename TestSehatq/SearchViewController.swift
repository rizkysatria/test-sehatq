//
//  SearchViewController.swift
//  TestSehatq
//
//  Created by rizky satria on 05/07/21.
//

import UIKit
import RxSwift

class SearchViewController: UIViewController {
    
    class func create() -> SearchViewController {
        return Utility.getViewControllerFromStoryboard("SearchViewController", storyboardName: "Search") as! SearchViewController
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    private let disposeBag = DisposeBag()
    
    var searchViewModel: SearchViewModel!
    
    lazy var searchBar = UISearchBar(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = searchBar
        searchViewModel.viewDidLoad()
        setupViewModel()
        setupSearchBar()
        registerCell()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    private func registerCell() {
        tableView.register(ListTableViewCell.nib(), forCellReuseIdentifier: ListTableViewCell.cellReuseIdentifier())
    }
    
    private func setupSearchBar() {
        searchBar.becomeFirstResponder()
        let bindToUIDisposable = searchViewModel.searchQuery.asObservable()
            .bind(to: searchBar.rx.text)
        let _ = searchBar.rx.text
            .subscribe(onNext: { [weak self] value in
                if let value = value {
                    self?.searchViewModel.searchQuery.accept(value)
                }
            }, onCompleted:  {
                bindToUIDisposable.dispose()
            })
    }
    
    private func setupViewModel() {
        searchViewModel.rxEventRefreshData
            .subscribe(onNext: { [weak self] in
                guard let weakSelf = self else { return }
                weakSelf.updateTableView()
        }).disposed(by: disposeBag)
    }
    
    private func showProductDetails(productId: String) {
        let productDetailsVC = ProductDetailViewController.create()
        productDetailsVC.setProductId(productId: productId)
        navigationController?.pushViewController(productDetailsVC, animated: true)
    }
    
    private func updateTableView() {
        tableView.isHidden = searchViewModel.resultProductPromoList.isEmpty
        tableView.reloadData()
    }
    
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchViewModel.resultProductPromoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.cellReuseIdentifier(), for: indexPath) as! ListTableViewCell
        let data = searchViewModel.resultProductPromoList[indexPath.row]
        cell.setupUI(imgUrl: data.imageUrl, name: data.title, price: data.price)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showProductDetails(productId: searchViewModel.resultProductPromoList[indexPath.row].id)
    }
    
}
