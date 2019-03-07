//
//  ArticleCDModel+CoreDataProperties.swift
//  SimpleNews
//
//  Created by Dmitry Polyakov on 07/03/2019.
//  Copyright © 2019 Dmitry Polyakov. All rights reserved.
//
//

import Foundation
import CoreData


extension ArticleCDModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ArticleCDModel> {
        return NSFetchRequest<ArticleCDModel>(entityName: "ArticleCDModel")
    }

    @NSManaged public var title: String
    @NSManaged public var author: String?
    @NSManaged public var info: String
    @NSManaged public var url: URL
    @NSManaged public var imageUrl: URL?
    @NSManaged public var date: NSDate
    @NSManaged public var content: String?
    @NSManaged public var source: ArticleSourceCDModel?

}
