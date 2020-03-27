//
//  StatisticsCell.swift
//  CoronaUpdate
//
//  Created by Sujal on 3/27/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class StatisticsCell: UITableViewCell {
    
    static let cellId = "statisticsCell"
    
    let countryLabel = UILabel(text: "Country", color: AppColor.primaryBlack, font: Poppins.medium, size: 24)
    let casesLabel = UILabel(text: "Cases", color: AppColor.primary, font: Poppins.regular, size: 18)
    let deathsLabel = UILabel(text: "Deaths", color: AppColor.buttonPink, font: Poppins.regular, size: 18)
    
    lazy var infoStack = VerticalStackView(arrangedSubViews: [countryLabel, casesLabel, deathsLabel], spacing: 4, distribution: .fillProportionally)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        setupView()
    }
    
    private func setupView() {
        addSubview(infoStack)
        infoStack.fillSuperview(padding: .init(top: 16, left: 20, bottom: 16, right: 20))
    }
    
    func configureCell(with data: StatisticsResponse?) {
        guard let data = data else { return }
        countryLabel.text = data.country ?? ""
        let cases = String(data.cases?.total ?? 0)
        casesLabel.text = "\(cases) Cases"
        
        let deaths = String(data.deaths?.total ?? 0)
        deathsLabel.text = "\(deaths) Deaths"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
