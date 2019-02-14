//
//  News.swift
//  SimpleNews
//
//  Created by Dmitry Polyakov on 14/02/2019.
//  Copyright © 2019 Dmitry Polyakov. All rights reserved.
//

struct News: Decodable {
    var totalResults: Int
    var articles: [Article]
}
