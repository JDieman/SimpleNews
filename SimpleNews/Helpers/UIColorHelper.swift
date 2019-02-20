//
//  UIColorHelper.swift
//  SimpleNews
//
//  Created by Dmitry Polyakov on 20/02/2019.
//  Copyright © 2019 Dmitry Polyakov. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat = 1) {
        self.init(displayP3Red: r/255, green: g/255, blue: b/255, alpha: alpha)
    }
}
