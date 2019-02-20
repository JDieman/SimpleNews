//
//  ArticleViewModel.swift
//  SimpleNews
//
//  Created by Dmitry Polyakov on 20/02/2019.
//  Copyright © 2019 Dmitry Polyakov. All rights reserved.
//

import UIKit

struct ArticleViewModel {
    
    private let imputModel: ArticleInputModel
    
    var linkButtonTitle: String {
        return Localization.linkButtonTitle.string
    }
    
    init(imputModel: ArticleInputModel) {
        self.imputModel = imputModel
    }
    
    func initialSetup(vc: ArticleViewController) {
        if let imageUrl = imputModel.article.imageUrl {
            vc.imageView.setImage(with: imageUrl)
        }
        vc.titleLabel.text = imputModel.article.title
        vc.dateLabel.text = imputModel.article.date?.formatted ?? ""
        vc.contentLabel.text = imputModel.article.description
    }
    
    func navigationBarSetup(in nc: UINavigationController?) {
        nc?.setNavigationBarHidden(false, animated: true)
    }
    
    func linkButtonTappedAction() {
        guard let url = imputModel.article.sourceUrl else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
