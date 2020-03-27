//
//  AlertHelper.swift
//  AEON-PMS-Vietnam
//
//  Created by Sujal on 6/11/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

struct AlertMessage {
    
    static func showBasicAlert(on vc: UIViewController, message: String) {
        let alert = UIAlertController(title: AppConstants.appName, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        vc.present(alert, animated: true)
    }
    
    static func showBasicAlertWithCompletion(on vc: UIViewController, message: String, okPressed: @escaping () -> Void) {
        let alert = UIAlertController(title: AppConstants.appName, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            okPressed()
        }
        alert.addAction(okAction)
        vc.present(alert, animated: true)
    }
    
    static func showCustomAlert(on vc: UIViewController, _ title: String? = AppConstants.appName, message: String, firstBtnTitle: String, secondBtnTitle: String, optionStyle: UIAlertAction.Style = .destructive, firstBtnPressed : @escaping () -> Void, secondBtnPressed : (() -> Void)? ) {
        
        let alertContoller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: firstBtnTitle, style: optionStyle) { _ in
            firstBtnPressed()
        }
        
        let cancelAction = UIAlertAction(title: secondBtnTitle, style: .default) { _ in
            if let secondBtnPressed = secondBtnPressed {
                secondBtnPressed()
            }
        }
        
        alertContoller.addAction(okAction)
        alertContoller.addAction(cancelAction)
        
        vc.present(alertContoller, animated: true, completion: nil)
    }
}
