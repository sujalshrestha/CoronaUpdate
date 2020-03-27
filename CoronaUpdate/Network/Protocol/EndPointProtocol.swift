//
//  EndPointProtocol.swift
//  CoronaUpdate
//
//  Created by Sujal on 3/27/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
import Moya

protocol BaseEndPointType: TargetType {}

protocol DataModel: Codable {
    var results: Int? { get set }
    var errors: [String]? { get set }
}

typealias Params = [String: Any]
