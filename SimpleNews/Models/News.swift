//
//  News.swift
//  SimpleNews
//
//  Created by Dmitry Polyakov on 14/02/2019.
//  Copyright © 2019 Dmitry Polyakov. All rights reserved.
//

struct News {
    var totalResults: Int
    var articles: [Article]
    
    init(totalResults: Int, articles: [Article]) {
        self.totalResults = totalResults
        self.articles = articles
    }
}

extension News: Decodable {
    
    enum Keys: String, CodingKey {
        case totalResults = "totalResults"
        case articles = "articles"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        
        let totalResults = try container.decode(Int.self, forKey: .totalResults)
        let articles = try container.decode([FailableDecodable<Article>].self, forKey: .articles).compactMap({$0.base})
        self.init(totalResults: totalResults, articles: articles)
    }
}
