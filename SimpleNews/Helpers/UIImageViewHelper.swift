//
//  UIImageViewHelper.swift
//  SimpleNews
//
//  Created by Dmitry Polyakov on 18/02/2019.
//  Copyright © 2019 Dmitry Polyakov. All rights reserved.
//

import UIKit
import AlamofireImage

extension UIImageView {
    func setImage(with url: URL, and placeholderImage: UIImage? = UIImage(named: "placeholder"), completion: (()->())? = nil) {
        af_setImage(withURL: url, placeholderImage: placeholderImage, filter: nil, progress: nil, progressQueue: DispatchQueue.global(), imageTransition: .crossDissolve(0.5), runImageTransitionIfCached: false) {
            (response) in
            completion?()
        }
    }
}
