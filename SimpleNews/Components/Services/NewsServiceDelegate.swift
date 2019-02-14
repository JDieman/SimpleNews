//
//  NewsServiceDelegate.swift
//  SimpleNews
//
//  Created by Dmitry Polyakov on 14/02/2019.
//  Copyright © 2019 Dmitry Polyakov. All rights reserved.
//

protocol NewsServiceDelegate: AnyObject {
    func onSuccess(_ news: News)
    func onError(_ message: String)
}
