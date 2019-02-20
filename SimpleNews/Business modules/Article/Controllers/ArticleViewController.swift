//
//  ArticleViewController.swift
//  SimpleNews
//
//  Created by Dmitry Polyakov on 18/02/2019.
//  Copyright © 2019 Dmitry Polyakov. All rights reserved.
//

import UIKit

final class ArticleViewController: UIViewController {

    var viewModel: ArticleViewModel?
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: TitleLabel!
    @IBOutlet var dateLabel: DescriptionLabel!
    @IBOutlet var contentLabel: RegularLabel!
    @IBOutlet var linkButton: UIButton! {
        didSet {
            linkButton.setTitle(viewModel?.linkButtonTitle, for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.initialSetup(vc: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel?.navigationBarSetup(in: self.navigationController)
    }
    
    @IBAction private func onTapLinkButton(_ sender: Any) {
        viewModel?.linkButtonTappedAction()
    }
    
}
