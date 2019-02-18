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
    
    static func getArticleVC(_ inputModel: ArticleInputModel) -> UIViewController {
        return getVC(inputModel) as ArticleViewController
    }
    
    private static func getVC<T: InitialSetuping>(_ inputModel: ControllerInputModel) -> T {
        let vc = T(nibName: String(describing: T.self), bundle: nil)
        vc.initialSetup(inputModel)
        return vc
    }
    
}
