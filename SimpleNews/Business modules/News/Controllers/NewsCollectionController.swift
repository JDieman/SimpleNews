//
//  NewsCollectionController.swift
//  SimpleNews
//
//  Created by Dmitry Polyakov on 14/02/2019.
//  Copyright © 2019 Dmitry Polyakov. All rights reserved.
//

import UIKit

final class NewsCollectionController {
    
    private let cellName = ArticleCell.self
    private unowned var delegate: NewsCollectionControllerDelegate
    private var items: [ArticleCellViewModel] = []
    
    init( delegate: NewsCollectionControllerDelegate) {
        self.delegate = delegate
    }
    
}


extension NewsCollectionController: NewsControllerProtocol {
    
    func registerCells(in tableView: UITableView) {
        tableView.register(cellName)
    }
    
    func cell(in tableView: UITableView, for indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: cellName), for: indexPath) as? ArticleCell,
            let model = items[safe: indexPath.row] else { return UITableViewCell() }
        model.setup(cell: cell)
        return cell
    }
    
    func height(forRow indexPath: IndexPath) -> CGFloat {
        return items[indexPath.row].height
    }
    
    func numberOfRows(in section: Int) -> Int {
        return items.count
    }
    
    func update(_ news: News) {
        items = news.articles.compactMap({ ArticleCellViewModel(article: $0) })
    }
    
    func didSelectRow(at indexPath: IndexPath, in tableView: UITableView) {
        guard let model = items[safe: indexPath.row] else { return }
        delegate.pushArticleVC(for: ArticleInputModel(article: model.article))
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
}
