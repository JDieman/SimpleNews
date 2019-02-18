//
//  ArticleCellModel.swift
//  SimpleNews
//
//  Created by Dmitry Polyakov on 14/02/2019.
//  Copyright © 2019 Dmitry Polyakov. All rights reserved.
//

import Foundation
import CoreGraphics
import AlamofireImage

struct ArticleCellViewModel {
    let height: CGFloat = 250
    let article: Article
    
    init?(article: Article) {
        self.article = article
    }
    
    func setup(cell: ArticleCell) {
        cell.model = self
        cell.titleLabel.text = article.title
        cell.dateLabel.text = article.date?.formatted ?? ""
        cell.articleImageView.image = nil
        if let url = article.imageUrl {
            cell.articleImageView.setImage(with: url) {
                if cell.model?.article.imageUrl != self.article.imageUrl {
                    cell.articleImageView.image = nil
                }
            }
        }
    }
    
}
