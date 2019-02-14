//
//  ArticleImageView.swift
//  SimpleNews
//
//  Created by Dmitry Polyakov on 15/02/2019.
//  Copyright © 2019 Dmitry Polyakov. All rights reserved.
//

import UIKit

final class ArticleImageView: UIImageView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentMode = .scaleAspectFill
        clipsToBounds = true
    }
}
