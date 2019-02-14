//
//  LocalizableString.swift
//  SimpleNews
//
//  Created by Dmitry Polyakov on 14/02/2019.
//  Copyright © 2019 Dmitry Polyakov. All rights reserved.
//

import Foundation

enum Localization: String {
    case defaultError
    
    var string: String {
        return NSLocalizedString(self.rawValue, comment: self.rawValue)
    }
}
