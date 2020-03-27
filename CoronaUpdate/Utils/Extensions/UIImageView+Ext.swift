//
//  UIImageView+Ext.swift
//  ecommerce
//
//  Created by Sujal on 6/26/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

extension UIImageView {
    convenience init(image: UIImage? = nil, contentMode: UIView.ContentMode, clipsToBounds: Bool = false) {
        self.init(frame: .zero)
        self.contentMode = contentMode
        self.clipsToBounds = clipsToBounds
        self.image = image
    }
}
