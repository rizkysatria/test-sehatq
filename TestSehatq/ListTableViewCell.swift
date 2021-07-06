//
//  ListTableViewCell.swift
//  TestSehatq
//
//  Created by rizky satria on 06/07/21.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupUI(imgUrl: String, name: String, price: String) {
        productImage.loadUrl(imgUrl)
        productNameLabel.text = name
        productPriceLabel.text = price
    }
    
}
