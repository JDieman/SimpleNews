//
//  DisplayCollection.swift
//  SimpleNews
//
//  Created by Dmitry Polyakov on 14/02/2019.
//  Copyright © 2019 Dmitry Polyakov. All rights reserved.
//

import UIKit

protocol DisplayCollection {
    var numberOfSections: Int { get }
    func numberOfRows(in section: Int) -> Int
    func height(forRow indexPath: IndexPath) -> CGFloat
    func registerCells(in tableView: UITableView)
}

extension DisplayCollection {
    var numberOfSections: Int {
        return 1
    }
}
