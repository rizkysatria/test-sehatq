//
//  CategoryTableViewCell.swift
//  TestSehatq
//
//  Created by rizky satria on 05/07/21.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var categoryList: [CategoryModel] = [CategoryModel]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        registerCell()
    }
    
    func setupUI(categoryList: [CategoryModel]) {
        self.categoryList = categoryList
        collectionView.reloadData()
    }
    
    private func registerCell() {
        collectionView.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCollectionViewCell")
    }
    
}

extension CategoryTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
        let data = categoryList[indexPath.row]
        cell.setupUI(imgUrl: data.imageUrl ?? "", productName: data.name ?? "")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Utility.getScreenWidth()/4, height: Utility.getScreenWidth()/4 + 10)
    }
    
    
}
