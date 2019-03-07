//
//  Storage.swift
//  SimpleNews
//
//  Created by Dmitry Polyakov on 07/03/2019.
//  Copyright © 2019 Dmitry Polyakov. All rights reserved.
//

protocol Storage {
    func getArticles() -> [Article]
    func update(_ articles: [Article])
    func removeAll()
}
