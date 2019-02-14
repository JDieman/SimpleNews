//
//  ArticleCell.swift
//  SimpleNews
//
//  Created by Dmitry Polyakov on 14/02/2019.
//  Copyright © 2019 Dmitry Polyakov. All rights reserved.
//

import UIKit
import AlamofireImage

class ArticleCell: UITableViewCell {

    private var model: ArticleCellModel?
    
    @IBOutlet var articleImageView: ArticleImageView!
    @IBOutlet var titleLabel: SubTitleLabel!
    @IBOutlet var dateLabel: DescriptionLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func prepareCell(_ model: ArticleCellModel) {
        self.model = model
        titleLabel.text = model.title
        dateLabel.text = model.date?.formatted ?? ""
        articleImageView.image = nil
        if let url = model.imageUrl {
            articleImageView.af_setImage(withURL: url, placeholderImage: nil, filter: nil, progress: nil, progressQueue: DispatchQueue.global(), imageTransition: .crossDissolve(0.5), runImageTransitionIfCached: true) {
                [weak self]
                (response) in
                if self?.model?.imageUrl != model.imageUrl {
                    self?.articleImageView.image = nil
                }
            }
        }
        
        
        
        
//        af_setImageWithURL(URL, placeholderImage: nil, filter: nil, imageTransition: .None, completion: { (response) -> Void in
//            print("image: \(cell.imageView.image)")
//            print(response.result.value) //# UIImage
//            print(response.result.error) //# NSError
//
//        })
    }
    
}
