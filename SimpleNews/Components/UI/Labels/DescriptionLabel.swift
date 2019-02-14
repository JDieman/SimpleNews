//
//  DescriptionLabel.swift
//  SimpleNews
//
//  Created by Dmitry Polyakov on 15/02/2019.
//  Copyright © 2019 Dmitry Polyakov. All rights reserved.
//

import UIKit

final class DescriptionLabel: UILabel {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        font = Fonts.small
        textColor = Colors.secondary
    }
}
