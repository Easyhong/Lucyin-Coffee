//
//  UITableView+Extension.swift
//  luckincoffee
//
//  Created by taozhang on 2020/5/2.
//  Copyright © 2020 Easyhong. All rights reserved.
//

import Foundation
import UIKit

public extension UICollectionView {
    
    public func register(with nibName: String) {
        register(UINib(nibName: nibName, bundle: nil),
                 forCellWithReuseIdentifier: nibName)
    }
    
    public func register<T: UICollectionViewCell>(with cell: T.Type) {
        register(UINib(nibName: cell.nibName, bundle: nil),
                 forCellWithReuseIdentifier: cell.nibName)
    }
    
    public func dequeueReusableCell<T: UICollectionViewCell>(cell: T.Type, for indexPath: IndexPath) -> T? {
        let cell = dequeueReusableCell(withReuseIdentifier: cell.nibName,
                                       for: indexPath) as? T
        return cell
    }
    
}
