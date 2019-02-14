//
//  NetworkClient.swift
//  SimpleNews
//
//  Created by Dmitry Polyakov on 14/02/2019.
//  Copyright © 2019 Dmitry Polyakov. All rights reserved.
//

import Moya

struct MoyaNetworkClient: NetworkClient {

    private let provider = MoyaProvider<GoogleNewsClient>()
    
    func getNews(by theme: String?,  completion: @escaping (NewsServiceResponce)->()) {
        provider.request(.getNews(theme: theme)) { result in
            switch result {
            case let .success(response):
                guard let news = try? response.map(News.self) else {
                    completion(.onError(Localization.defaultError.string))
                    return
                }
                completion(.onSuccess(news))
            case let .failure(error):
                completion(.onError(error.errorDescription))
            }
        }
    }
}
