//
//  ArticleCDModel+CoreDataClass.swift
//  SimpleNews
//
//  Created by Dmitry Polyakov on 07/03/2019.
//  Copyright © 2019 Dmitry Polyakov. All rights reserved.
//
//

import Foundation
import CoreData


public class ArticleCDModel: NSManagedObject {
    
    var article: Article {
        return Article(title: title,
                       author: author,
                       description: info,
                       sourceUrl: url,
                       imageUrl: imageUrl,
                       date: (date as Date),
                       content: content,
                       source: source?.articleSource)
    }
    
    convenience init?(from article: Article, insertInto context: NSManagedObjectContext?) {
        guard let date = article.date as NSDate? else { return nil }
        self.init(entity: ArticleCDModel.entity(), insertInto: context)
        title = article.title
        author = article.author
        content = article.content
        info = article.description
        imageUrl = article.imageUrl
        self.date = date
        self.url = article.sourceUrl
        source = ArticleSourceCDModel(from: article.source, insertInto: context)
    }
    
}
