//
//  NetworkRequest.swift
//  AEON-PMS-Vietnam
//
//  Created by Sujal on 6/10/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation
import Moya
import RxSwift
import Alamofire

protocol NetworkProtocol {
    var disposeBag: DisposeBag { get set }
    func request<T: BaseEndPointType, U: DataModel>(api: T, dataModel: U.Type) -> Observable<NetworkResponse>
}

extension NetworkProtocol {
    func request<T: BaseEndPointType, U: DataModel>(api: T, dataModel: U.Type) -> Observable<NetworkResponse> {
        let serviceManager = ServiceManager.sharedManager
        
        let service = MoyaProvider<T>(session: serviceManager, plugins: [NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))])
        
        return Observable.create({ (observer) -> Disposable in
            service.request(api) { (result) in
                switch result {
                case .success(let response):
                    do {
                        let responseModel = try JSONDecoder().decode(dataModel.self, from: response.data)
                        var successResponse: NetworkResponse
                        
                        let messageData = responseModel.errors?.first ?? ""
                        
                        if response.statusCode >= 200 && response.statusCode <= 300 {
                            successResponse = NetworkResponse(objects: responseModel, message: messageData, statusCode: response.statusCode, success: true)
                        } else {
                            if responseModel.errors != nil {
                                successResponse = NetworkResponse(objects: responseModel, message: messageData, statusCode: response.statusCode, success: false)
                            } else {
                                successResponse = NetworkResponse(objects: responseModel, message: messageData, statusCode: response.statusCode, success: false)
                            }
                        }
                        observer.onNext(successResponse)
                        observer.onCompleted()
                    } catch let error {
                        let failureResponse = NetworkResponse(objects: nil, message: error.localizedDescription, statusCode: 400, success: false)
                        observer.onNext(failureResponse)
                        observer.onCompleted()
                    }
                case .failure(let error):
                    let moyaError = error
                    let response = moyaError.response
                    let statusCode = response?.statusCode ?? 400
                    let failureResponse = NetworkResponse(objects: nil, message: error.localizedDescription, statusCode: statusCode, success: false)
                    observer.onNext(failureResponse)
                    observer.onCompleted()
                }
            }
            return Disposables.create()
        })
    }
}
