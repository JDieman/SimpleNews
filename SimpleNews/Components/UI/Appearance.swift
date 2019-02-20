//
//  Appearance.swift
//  SimpleNews
//
//  Created by Dmitry Polyakov on 20/02/2019.
//  Copyright © 2019 Dmitry Polyakov. All rights reserved.
//

import UIKit

struct Appearance {
    
    private init() {}
    
    static func setDefault() {
        UIButton.appearance().tintColor = Colors.main
        UILabel.appearance().textColor = Colors.titleColor
    }

}
