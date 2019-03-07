//
//  Article.swift
//  SimpleNews
//
//  Created by Dmitry Polyakov on 14/02/2019.
//  Copyright © 2019 Dmitry Polyakov. All rights reserved.
//

import Foundation

struct Article {
    
    var title: String
    var author: String?
    var description: String
    var content: String?
    var source: ArticleSource?
    var sourceUrl: URL
    var imageUrl: URL?
    var date: Date
    
    init(title: String, author: String?, description: String, sourceUrl: URL, imageUrl: URL?, date: Date, content: String?, source: ArticleSource?) {
        self.title = title
        self.author = author
        self.description = description
        self.sourceUrl = sourceUrl
        self.imageUrl = imageUrl
        self.date = date
        self.content = content
        self.source = source
    }
    
}

extension Article: Decodable {
    
    enum Keys: String, CodingKey {
        case title = "title"
        case author = "author"
        case description = "description"
        case url = "url"
        case urlToImage = "urlToImage"
        case publishedAt = "publishedAt"
        case content = "content"
        case source = "source"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        
        let title = try container.decode(String.self, forKey: .title)
        let author = try container.decodeIfPresent(String.self, forKey: .author)
        let description = try container.decode(String.self, forKey: .description)
        let url = try container.decode(String.self, forKey: .url)
        let urlToImage = try container.decodeIfPresent(String.self, forKey: .urlToImage)
        let publishedAt = try container.decode(String.self, forKey: .publishedAt)
        let content = try container.decodeIfPresent(String.self, forKey: .content)
        let source = try container.decodeIfPresent(ArticleSource.self, forKey: .source)
        guard let sourceUrl = URL(string: url), let date = Date(string: publishedAt) else { throw NSError() }
        self.init(title: title,
                  author: author,
                  description: description,
                  sourceUrl: sourceUrl,
                  imageUrl: URL(string: urlToImage ?? ""),
                  date: date,
                  content: content,
                  source: source)
    }
}
