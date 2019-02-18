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
    private let title: String
    private let imageUrl: URL?
    private let date: Date?
    
    init?(title: String?, imageUrl: URL?, date: Date?) {
        guard let title = title, let imageUrl = imageUrl, let date = date else { return nil }
        self.init(title: title, imageUrl: imageUrl, date: date)
    }
    
    init(title: String, imageUrl: URL, date: Date) {
        self.title = title
        self.imageUrl = imageUrl
        self.date = date
    }
    
    func setup(cell: ArticleCell) {
        cell.titleLabel.text = title
        cell.dateLabel.text = date?.formatted ?? ""
        cell.articleImageView.image = nil
        if let url = imageUrl {
            cell.articleImageView.af_setImage(withURL: url, placeholderImage: nil, filter: nil, progress: nil, progressQueue: DispatchQueue.global(), imageTransition: .crossDissolve(0.5), runImageTransitionIfCached: false) {
                (response) in
                if cell.model?.imageUrl != self.imageUrl {
                    cell.articleImageView.image = nil
                }
            }
        }
    }
    
}
