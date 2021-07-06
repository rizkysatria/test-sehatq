//
//  CellExtension.swift
//  TestSehatq
//
//  Created by rizky satria on 06/07/21.
//

import UIKit

extension UITableViewCell {
    
    static func nib() -> UINib {
        return UINib(nibName: String(describing: self), bundle: Bundle(for: self))
    }
    
    static func cellReuseIdentifier() -> String {
        return String(describing: self)
    }
}

extension UICollectionViewCell {
    
    static func nib() -> UINib {
        return UINib(nibName: String(describing: self), bundle: Bundle(for: self))
    }
    
    static func cellReuseIdentifier() -> String {
        return String(describing: self)
    }
}
