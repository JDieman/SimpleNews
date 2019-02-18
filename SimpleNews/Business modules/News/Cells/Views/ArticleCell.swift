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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func prepareCell(_ model: ArticleCellViewModel) {
        self.model = model
        model.setup(cell: self)
    }
    
}
