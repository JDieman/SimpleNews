//
//  ArticleCell.swift
//  SimpleNews
//
//  Created by Dmitry Polyakov on 14/02/2019.
//  Copyright © 2019 Dmitry Polyakov. All rights reserved.
//

import UIKit

class ArticleCell: UITableViewCell {

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
    
    func prepareCell(_ model: ArticleCellModel) {
        titleLabel.text = model.title
        dateLabel.text = model.date?.formatted ?? ""
    }
    
}
