//
//  UIImageExtension.swift
//  TestSehatq
//
//  Created by rizky satria on 05/07/21.
import UIKit
import SDWebImage

extension UIImageView {
    func loadUrl(_ urlString: String, completion: ((_ image: UIImage?) -> Void)? = nil) {
        guard let url = URL(string: urlString) else { return }
        sd_setImage(with: url, placeholderImage: nil, options: .highPriority) { image, error, _, _ -> Void in
            guard let completion = completion , error == nil else { return }
            completion(image)
        }
    }
}


