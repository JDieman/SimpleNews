//
//  Factory.swift
//  SimpleNews
//
//  Created by Dmitry Polyakov on 14/02/2019.
//  Copyright © 2019 Dmitry Polyakov. All rights reserved.
//

struct Factory {
    
    private init() {}
    
    static var networkClient: NetworkClient {
        return MoyaNetworkClient()
    }
    
    static func getNewsController(delegate: NewsCollectionControllerDelegate) -> NewsControllerProtocol {
        return NewsCollectionController(delegate: delegate)
    }
}
