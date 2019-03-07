//
//  ArticleSourceCDModel+CoreDataProperties.swift
//  SimpleNews
//
//  Created by Dmitry Polyakov on 07/03/2019.
//  Copyright © 2019 Dmitry Polyakov. All rights reserved.
//
//

import Foundation
import CoreData


extension ArticleSourceCDModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ArticleSourceCDModel> {
        return NSFetchRequest<ArticleSourceCDModel>(entityName: "ArticleSourceCDModel")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var article: ArticleCDModel?

}
