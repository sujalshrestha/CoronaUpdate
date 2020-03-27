//
//  UIButton+Ext.swift
//  ecommerce
//
//  Created by Sujal on 6/26/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

extension UIButton {
    
    convenience init(buttonImage: UIImage) {
        self.init(type: .system)
        self.setImage(buttonImage.withRenderingMode(.alwaysOriginal), for: .normal)
    }
    
    convenience init(title: String, titleColor: UIColor, backgroundColor: UIColor? = nil, font: FontFamily, fontSize: CGFloat, numberOfLines: Int = 1, cornerRadius: CGFloat? = nil) {
        self.init(type: .system)
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.titleLabel?.font = UIFont.font(with: fontSize, family: font)
        self.titleLabel?.numberOfLines = numberOfLines
        self.titleLabel?.textAlignment = .center
        if let cornerRadius = cornerRadius {
            self.layer.cornerRadius = cornerRadius
        }
        self.backgroundColor = backgroundColor
    }
    
}
