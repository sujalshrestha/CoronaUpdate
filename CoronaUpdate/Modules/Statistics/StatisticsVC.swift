//
//  StatisticsVC.swift
//  CoronaUpdate
//
//  Created by Sujal on 3/27/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class StatisticsVC: UITableViewController {
    
    let viewModel: StatisticsViewModel
    
    init() {
        viewModel = StatisticsViewModel(bag: DisposeBag())
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupTableView()
        observeNetworkEvents()
        viewModel.getStatistics()
    }
    
    private func setupNavigationBar() {
        title = AppConstants.appName
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
    }
    
    private func setupTableView() {
        tableView.register(StatisticsCell.self, forCellReuseIdentifier: StatisticsCell.cellId)
        tableView.tableFooterView = UIView()
        tableView.dataSource = nil
    }
    
    private func observeNetworkEvents() {
        viewModel.showHud.subscribe(onNext: { [unowned self] showHud in
            guard let showHud = showHud else { return }
            showHud ? self.showHUD() : self.hideHUD()
        }).disposed(by: viewModel.bag)
        
        viewModel.networkResponse.subscribe(onNext: { [unowned self] response in
            guard let response = response else { return }
            if !response.success {
                AlertMessage.showBasicAlert(on: self, message: response.message)
            }
        }).disposed(by: viewModel.bag)
        
        viewModel.statistics.bind(to: tableView.rx.items(cellIdentifier: StatisticsCell.cellId, cellType: StatisticsCell.self)) { row, model, cell in
            cell.configureCell(with: model)
            cell.accessoryType = .disclosureIndicator
        }.disposed(by: viewModel.bag)
        
        tableView.rx.modelSelected(StatisticsResponse.self).subscribe(onNext: { [weak self] selectedItem in
            guard let self = self else { return }
            let controller = DetailsVC(statisticData: selectedItem)
            self.navigationController?.pushViewController(controller, animated: true)
        }).disposed(by: viewModel.bag)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
