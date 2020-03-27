//
//  FontConstants.swift
//  Aeon Wallet
//
//  Created by Sujal on 4/15/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

typealias AppFont = UIFont

extension AppFont {
    static func font(with size: CGFloat, family: FontFamily?) -> AppFont {
        guard let family = family, let requiredFont = UIFont(name: family.value, size: size) else {
            return UIFont.systemFont(ofSize: size)
        }
        return requiredFont
    }
}

protocol FontFamily {
    var value: String { get }
}

enum Poppins: FontFamily {
    case regular
    case bold
    case light
    case medium
    
    var value: String {
        switch self {
        case .regular: return "Poppins-Regular"
        case .bold: return "Poppins-Bold"
        case .light: return "Poppins-Light"
        case .medium: return "Poppins-Medium"
        }
    }
}
