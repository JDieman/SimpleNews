//
//  ArticleSourceCDModel+CoreDataClass.swift
//  SimpleNews
//
//  Created by Dmitry Polyakov on 07/03/2019.
//  Copyright © 2019 Dmitry Polyakov. All rights reserved.
//
//

import Foundation
import CoreData


public class ArticleSourceCDModel: NSManagedObject {
    
    var articleSource: ArticleSource {
        return ArticleSource(id: id, name: name)
    }

    convenience init?(from articleSource: ArticleSource?, insertInto context: NSManagedObjectContext?) {
        guard let articleSource = articleSource else { return nil }
        self.init(entity: ArticleSourceCDModel.entity(), insertInto: context)
        id = articleSource.id
        name = articleSource.name
    }
}
