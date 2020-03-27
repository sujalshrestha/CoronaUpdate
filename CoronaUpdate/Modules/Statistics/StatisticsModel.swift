//
//  StatisticsModel.swift
//  CoronaUpdate
//
//  Created by Sujal on 3/27/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation

struct StatisticsModel: DataModel {
    var results: Int?
    var errors: [String]?
    
    let response: [StatisticsResponse]?
}

struct StatisticsResponse: DataModel {
    var results: Int?
    var errors: [String]?
    let country: String?
    let cases: StatisticsCases?
    let deaths: StatisticsDeaths?
}

struct StatisticsCases: DataModel {
    var results: Int?
    var errors: [String]?
    let total: Int?
    let new: String?
    let active: Int?
    let critical: Int?
    let recovered: Int?
}

struct StatisticsDeaths: DataModel {
    var results: Int?
    var errors: [String]?
    let total: Int?
    let new: String?
}
