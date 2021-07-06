//
//  HomeViewController.swift
//  TestSehatq
//
//  Created by rizky satria on 05/07/21.
//

import UIKit
import RxSwift

class HomeViewController: UIViewController {
    
    class func create() -> HomeViewController {
        return Utility.getViewControllerFromStoryboard("HomeViewController", storyboardName: "Home") as! HomeViewController
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    var homeViewModel: HomeViewModel!
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
        homeViewModel.viewDidLoad()
        registerCell()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    private func setupViewModel() {
        homeViewModel.rxEventLoadData
            .subscribe(onNext: { [weak self] in
                self?.tableView.reloadData()
        }).disposed(by: disposeBag)
    }
    
    private func registerCell() {
        tableView.register(UINib(nibName: "CategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoryTableViewCell")
        tableView.register(UINib(nibName: "ProductLisTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductLisTableViewCell")
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return homeViewModel.productList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell", for: indexPath) as! CategoryTableViewCell
            cell.setupUI(categoryList: homeViewModel.categoryList)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductLisTableViewCell", for: indexPath) as! ProductLisTableViewCell
            let data = homeViewModel.productList[indexPath.row]
            cell.setupUI(productPromoModel: data)
            return cell
            
        default:
        return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return Utility.getScreenWidth()/4 + 10
        }
        return Utility.getScreenWidth()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    
}
