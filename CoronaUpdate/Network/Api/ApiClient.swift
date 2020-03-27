//
//  LoginApi.swift
//  AeonIndia
//
//  Created by Sujal on 3/19/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class ApiClient {
    
    let bag: DisposeBag
    let networkResponse = BehaviorRelay<NetworkResponse?>.init(value: nil)
    let networkManager: NetworkManager
    
    init(bag: DisposeBag) {
        self.bag = bag
        self.networkManager = NetworkManager(disposeBag: bag)
    }
    
    func getStatistics(onComplete: @escaping (NetworkResponse) -> Void) {
        networkManager.request(api: ApiRouter.getStats, dataModel: StatisticsModel.self)
            .subscribe(onNext: { response in
                onComplete(response)
            })
        .disposed(by: bag)
    }
}
