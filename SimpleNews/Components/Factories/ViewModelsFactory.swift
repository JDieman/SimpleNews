//
//  ViewModelsFactory.swift
//  SimpleNews
//
//  Created by Dmitry Polyakov on 20/02/2019.
//  Copyright © 2019 Dmitry Polyakov. All rights reserved.
//

struct ViewModelsFactory {
    
    private init() {}
    
    static func getArticleVM(_ inputModel: ArticleInputModel) -> ArticleViewModel {
        return ArticleViewModel(imputModel: inputModel)
    }

}
