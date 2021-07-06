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
        tableView.register(UINib(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: "ListTableViewCell")
    }
    
    private func setupSearchBar() {
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
                self?.tableView.reloadData()
        }).disposed(by: disposeBag)
    }
    
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchViewModel.resultProductPromoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as! ListTableViewCell
        let data = searchViewModel.resultProductPromoList[indexPath.row]
        cell.setupUI(imgUrl: data.imageUrl, name: data.title, price: data.price)
        return cell
    }
    
}
