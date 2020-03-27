//
//  UIViewController+Ext.swift
//  ecommerce
//
//  Created by Sujal on 6/26/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import SVProgressHUD

extension UIViewController {
    func add(_ child: UIViewController, innerView: UIView? = nil) {
        addChild(child)
        if innerView == nil {
            view.addSubview(child.view)
        } else {
            innerView!.addSubview(child.view)
        }
        child.didMove(toParent: self)
    }
    
    func remove() {
        guard parent != nil else {
            return
        }
        willMove(toParent: nil)
        removeFromParent()
        view.removeFromSuperview()
    }
    
    func showHUD() {
        SVProgressHUD.setForegroundColor(AppColor.primary)
        SVProgressHUD.show()
        SVProgressHUD.setDefaultMaskType(.black)
    }
    
    func hideHUD() {
        SVProgressHUD.dismiss()
    }
}

