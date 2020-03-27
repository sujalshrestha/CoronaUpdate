//
//  LoginRouter.swift
//  GoPrint-iOS
//
//  Created by Sujal on 12/11/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation
import Moya

enum ApiRouter {
    case getStats
}

extension ApiRouter: BaseEndPointType {
    var baseURL: URL {
        return URL(string: ApiConstants.baseUrl)!
    }
    
    var path: String {
        switch self {
        case .getStats: return ApiConstants.getStats
        }
    }
    
    var method: Moya.Method {
        switch self {
        default: return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getStats: return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return [
                "Content-Type": "application/json",
                "x-rapidapi-host": ApiConstants.host,
                "x-rapidapi-key": ApiConstants.key
            ]
        }
    }
}
