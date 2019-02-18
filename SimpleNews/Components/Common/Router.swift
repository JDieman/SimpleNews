//
//  Router.swift
//  SimpleNews
//
//  Created by Dmitry Polyakov on 18/02/2019.
//  Copyright © 2019 Dmitry Polyakov. All rights reserved.
//

import UIKit

struct Router {
    
    private init() {}
    
    static func pushArticleVC(from vc: UIViewController, for model: ArticleInputModel, animated: Bool) {
        vc.navigationController?.pushViewController(ViewControllersFactory.getArticleVC(model), animated: animated)
    }
}
