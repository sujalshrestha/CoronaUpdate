//
//  StatisticsViewModel.swift
//  CoronaUpdate
//
//  Created by Sujal on 3/27/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class StatisticsViewModel {
    let bag: DisposeBag
    let apiClient: ApiClient
    let networkResponse = BehaviorRelay<NetworkResponse?>.init(value: nil)
    let statistics = BehaviorRelay<[StatisticsResponse]>.init(value: [StatisticsResponse]())
    let showHud = BehaviorRelay<Bool?>.init(value: nil)
    
    init(bag: DisposeBag) {
        self.bag = bag
        self.apiClient = ApiClient(bag: self.bag)
    }
    
    func getStatistics() {
        showHud.accept(true)
        
        apiClient.getStatistics { [weak self] (response) in
            guard let self = self else { return }
            self.handleResponse(response: response)
        }
    }
    
    private func handleResponse(response: NetworkResponse) {
        showHud.accept(false)
        if !response.success {
            networkResponse.accept(response)
            return
        }
        guard let dataResponse = response.objects as? StatisticsModel else { return }
        guard let statisticsData = dataResponse.response else { return }
        statistics.accept(statisticsData)
    }
}
