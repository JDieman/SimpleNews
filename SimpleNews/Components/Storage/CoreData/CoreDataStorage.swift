//
//  CoreDataStorage.swift
//  SimpleNews
//
//  Created by Dmitry Polyakov on 07/03/2019.
//  Copyright © 2019 Dmitry Polyakov. All rights reserved.
//

import CoreData

final class CoreDataStorage: Storage {
    
    func getArticles() -> [Article] {
        let fetchRequest = NSFetchRequest<ArticleCDModel>(entityName: ArticleCDModel.name)
        let sortByDate = NSSortDescriptor(key: #keyPath(ArticleCDModel.date), ascending: false)
        fetchRequest.sortDescriptors = [sortByDate]
        do {
            let results = try CoreDataManager.instance.context.fetch(fetchRequest)
            return results.map({ $0.article })
        } catch {
            print(error)
            return []
        }
    }
    
    func update(_ articles: [Article]) {
        removeAll()
        let context = CoreDataManager.instance.context
        context.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        articles.forEach {
            _ = ArticleCDModel(from: $0, insertInto: context)
        }
        CoreDataManager.instance.saveContext()
    }
    
    func removeAll() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: ArticleCDModel.name)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do {
            try CoreDataManager.instance.context.execute(deleteRequest)
            CoreDataManager.instance.saveContext()
        } catch {
            print(error)
        }
    }
    
}
