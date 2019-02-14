//
//  Article.swift
//  SimpleNews
//
//  Created by Dmitry Polyakov on 14/02/2019.
//  Copyright © 2019 Dmitry Polyakov. All rights reserved.
//

import Foundation

struct Article: Decodable {
    
    var title: String?
    var author: String?
    var description: String?
    private var url: String?
    private var urlToImage: String?
    var publishedAt: String?
    var content: String?
    var source: ArticleSource?
    
    var sourceUrl: URL? {
        return URL(string: url ?? "")
    }
    var imageUrl: URL? {
        return URL(string: urlToImage ?? "")
    }
    var date: Date?{
        return Date(string: publishedAt)
    }
}
