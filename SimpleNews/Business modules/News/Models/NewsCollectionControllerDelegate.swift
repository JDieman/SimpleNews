//
//  NewsCollectionControllerDelegate.swift
//  SimpleNews
//
//  Created by Dmitry Polyakov on 14/02/2019.
//  Copyright © 2019 Dmitry Polyakov. All rights reserved.
//

protocol NewsCollectionControllerDelegate: AnyObject {
    func pushArticleVC(for model: ArticleInputModel)
}
