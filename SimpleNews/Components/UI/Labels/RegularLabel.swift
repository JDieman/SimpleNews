//
//  RegularLabel.swift
//  SimpleNews
//
//  Created by Dmitry Polyakov on 18/02/2019.
//  Copyright © 2019 Dmitry Polyakov. All rights reserved.
//

import UIKit

final class RegularLabel: UILabel {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        font = Fonts.regular
        textColor = Colors.regularText
    }
}

