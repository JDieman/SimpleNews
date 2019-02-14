//
//  NewsControllerProtocol.swift
//  SimpleNews
//
//  Created by Dmitry Polyakov on 14/02/2019.
//  Copyright © 2019 Dmitry Polyakov. All rights reserved.
//

import UIKit

protocol NewsControllerProtocol: DisplayCollection {
    func update(_ news: News)
    func cell(in tableView: UITableView, for indexPath: IndexPath) -> UITableViewCell
}
