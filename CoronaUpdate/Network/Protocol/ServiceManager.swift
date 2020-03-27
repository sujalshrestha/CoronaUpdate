//
//  ServiceManager.swift
//  AEON-PMS-Vietnam
//
//  Created by Sujal on 6/10/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation
import Alamofire

class ServiceManager: Alamofire.Session {
    static let sharedManager: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.headers = .default
        configuration.timeoutIntervalForRequest = 60
        configuration.timeoutIntervalForResource = 60
        configuration.requestCachePolicy = .useProtocolCachePolicy
        return Session(configuration: configuration)
    }()
}
