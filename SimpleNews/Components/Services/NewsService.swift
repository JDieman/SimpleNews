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
    
    init(delegate: NewsServiceDelegate, networkClient: NetworkClient) {
        self.delegate = delegate
        self.networkClient = networkClient
    }
    
    func getNews(theme: String?) {
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
