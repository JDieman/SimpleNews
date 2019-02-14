//
//  NetworkClient.swift
//  SimpleNews
//
//  Created by Dmitry Polyakov on 14/02/2019.
//  Copyright © 2019 Dmitry Polyakov. All rights reserved.
//

import Moya

enum GoogleNewsClient {
    case getNews(theme: String?)
}

extension GoogleNewsClient: TargetType {
    
    var baseURL: URL {
        return URL(string: "https://newsapi.org/v2")!
    }
    
    var path: String {
        switch self {
        case .getNews:
            return "/top-headlines"
        }
    }
    
    var method: Method {
        switch self {
        case .getNews:
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .getNews:
            return Data()
        }
    }
    
    var task: Task {
        var parameters = ["apiKey": "cf3ee994acf244109e941a93e40b58f1", "country": "ru"]
        switch self {
        case .getNews(let theme):
            if let theme = theme {
                parameters["q"] = theme
            }
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getNews:
            return nil
        }
    }
    
    var validationType: ValidationType {
        return .successCodes
    }
    

}
