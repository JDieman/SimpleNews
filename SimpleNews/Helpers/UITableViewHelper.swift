//
//  UITableViewHelper.swift
//  SimpleNews
//
//  Created by Dmitry Polyakov on 15/02/2019.
//  Copyright © 2019 Dmitry Polyakov. All rights reserved.
//

import UIKit

extension UITableView {
    
    func register<T>(_ cell: T) {
        register(UINib(nibName: String(describing: cell), bundle: nil), forCellReuseIdentifier: String(describing: cell))
    }
    
    func getReusableCell<T>(_ cell: T.Type, for indexPath: IndexPath) -> T? {
        return dequeueReusableCell(withIdentifier: String(describing: cell), for: indexPath) as? T
    }
    
}
