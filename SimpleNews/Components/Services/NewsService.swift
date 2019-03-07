//
//  NewsService.swift
//  SimpleNews
//
//  Created by Dmitry Polyakov on 14/02/2019.
//  Copyright © 2019 Dmitry Polyakov. All rights reserved.
//


struct NewsService {

    private unowned var delegate: NewsServiceDelegate
    private var networkClient: NetworkClient
    private var storage: Storage
    
    var savedNews: News {
        let articles = storage.getArticles()
        return News(totalResults: articles.count, articles: articles)
    }
    
    init(delegate: NewsServiceDelegate, networkClient: NetworkClient, storage: Storage) {
        self.delegate = delegate
        self.networkClient = networkClient
        self.storage = storage
    }
    
    func requestNews(theme: String?) {
        networkClient.getNews(by: theme, completion: completion)
    }
    
    private func completion(responce: NewsServiceResponce) {
        switch responce {
        case .onSuccess(let news):
            delegate.onSuccess(news)
        case .onError(let message):
            delegate.onError(message ?? Localization.defaultError.string)
        }
    }
}

enum NewsServiceResponce {
    case onSuccess(News)
    case onError(String?)
}
