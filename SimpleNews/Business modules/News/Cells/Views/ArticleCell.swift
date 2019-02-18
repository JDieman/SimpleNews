//
//  ArticleCell.swift
//  SimpleNews
//
//  Created by Dmitry Polyakov on 14/02/2019.
//  Copyright © 2019 Dmitry Polyakov. All rights reserved.
//

import UIKit

class ArticleCell: UITableViewCell {

    var model: ArticleCellViewModel?
    
    @IBOutlet var articleImageView: ArticleImageView!
    @IBOutlet var titleLabel: SubTitleLabel!
    @IBOutlet var dateLabel: DescriptionLabel!
    
}
