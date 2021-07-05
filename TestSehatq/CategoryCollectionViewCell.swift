//
//  CategoryCollectionViewCell.swift
//  TestSehatq
//
//  Created by rizky satria on 05/07/21.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setupUI(imgUrl: String, productName: String) {
        productImage.loadUrl(imgUrl)
        productNameLabel.text = productName
    }
    
}
