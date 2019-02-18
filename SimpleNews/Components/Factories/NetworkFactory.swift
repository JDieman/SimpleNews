//
//  NetworkFactory.swift
//  SimpleNews
//
//  Created by Dmitry Polyakov on 18/02/2019.
//  Copyright © 2019 Dmitry Polyakov. All rights reserved.
//

struct NetworkFactory {
    
    private init() {}
    
    static var networkClient: NetworkClient {
        return MoyaNetworkClient()
    }
}
