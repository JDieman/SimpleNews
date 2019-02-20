//
//  ControllerFactory.swift
//  SimpleNews
//
//  Created by Dmitry Polyakov on 18/02/2019.
//  Copyright © 2019 Dmitry Polyakov. All rights reserved.
//

import UIKit

struct ViewControllersFactory {
    
    private init() {}
    
    static func getArticleVC(for viewModel: ArticleViewModel) -> UIViewController {
        let vc = getVC() as ArticleViewController
        vc.viewModel = viewModel
        return vc
    }
    
    private static func getVC<T: UIViewController>() -> T {
        return T(nibName: String(describing: T.self), bundle: nil)
    }
    
}
