//
//  ArticleViewController.swift
//  SimpleNews
//
//  Created by Dmitry Polyakov on 18/02/2019.
//  Copyright © 2019 Dmitry Polyakov. All rights reserved.
//

import UIKit

final class ArticleViewController: UIViewController, InitialSetuping {

    private var model: ArticleInputModel?
    
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var titleLabel: TitleLabel!
    @IBOutlet private var dateLabel: DescriptionLabel!
    @IBOutlet private var contentLabel: RegularLabel!
    @IBOutlet var linkButton: UIButton! {
        didSet {
            linkButton.setTitle(Localization.linkButtonTitle.string, for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let model = model else { return }
        if let imageUrl = model.article.imageUrl {
            imageView.setImage(with: imageUrl)
        }
        titleLabel.text = model.article.title
        dateLabel.text = model.article.date?.formatted ?? ""
        contentLabel.text = model.article.description
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func initialSetup(_ model: ControllerInputModel) {
        self.model = model as? ArticleInputModel
    }
    
    @IBAction private func onTapLinkButton(_ sender: Any) {
        guard let url = model?.article.sourceUrl else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
}
