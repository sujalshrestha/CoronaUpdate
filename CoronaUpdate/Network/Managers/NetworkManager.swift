//
//  RegistrationManager.swift
//  AEON-PMS-Vietnam
//
//  Created by Sujal on 6/10/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation
import Moya
import RxSwift

class NetworkManager: NetworkProtocol {
    
    var disposeBag: DisposeBag
    
    init(disposeBag: DisposeBag) {
        self.disposeBag = disposeBag
    }
}
