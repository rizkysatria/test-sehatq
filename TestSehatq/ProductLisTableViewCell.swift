//
//  ProductLisTableViewCell.swift
//  TestSehatq
//
//  Created by rizky satria on 05/07/21.
//

import UIKit
import RxSwift
import RxCocoa

class ProductLisTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageContainer: UIView!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var likeIconImage: UIImageView!
    
    private let disposeBag = DisposeBag()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupBorder()
    }
    
    func setupUI(productPromoModel: ProductPromoModel) {
        productImage.loadUrl(productPromoModel.imageUrl ?? "")
        productNameLabel.text = productPromoModel.title ?? ""
        updateLikeIcon(likeCount: productPromoModel.loved ?? 0)
    }
    
    private func setupBorder() {
        imageContainer.layer.borderWidth = 1
        imageContainer.layer.borderColor = UIColor.gray.cgColor
        imageContainer.layer.cornerRadius = 10
    }
    
    private func updateLikeIcon(likeCount: Int) {
        likeIconImage.image = UIImage(named: likeCount == 0 ? "btnLikeOff" : "btnLikeOn")
    }
    
}
