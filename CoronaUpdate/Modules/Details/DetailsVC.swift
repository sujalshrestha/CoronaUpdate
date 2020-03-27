//
//  DetailsVC.swift
//  CoronaUpdate
//
//  Created by Sujal on 3/27/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class DetailsVC: UIViewController {
    
    let baseView = DetailsView()
    let statisticData: StatisticsResponse
    
    init(statisticData: StatisticsResponse) {
        self.statisticData = statisticData
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        baseView.configureData(data: statisticData)
        title = statisticData.country ?? ""
    }
    
    override func loadView() {
        view = baseView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
