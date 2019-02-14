//
//  ArticleCellModel.swift
//  SimpleNews
//
//  Created by Dmitry Polyakov on 14/02/2019.
//  Copyright © 2019 Dmitry Polyakov. All rights reserved.
//

import Foundation
import CoreGraphics

struct ArticleCellModel {
    let height: CGFloat = 150
    let title: String
    let imageUrl: URL?
    let date: Date?
    
    init?(title: String?, imageUrl: URL?, date: Date?) {
        guard let title = title, let imageUrl = imageUrl, let date = date else { return nil }
        self.init(title: title, imageUrl: imageUrl, date: date)
    }
    
    init(title: String, imageUrl: URL, date: Date) {
        self.title = title
        self.imageUrl = imageUrl
        self.date = date
    }
    
}
