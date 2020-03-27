//
//  DetailsView.swift
//  CoronaUpdate
//
//  Created by Sujal on 3/27/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class DetailsView: UIView {
    
    let casesLabel = UILabel(text: "Cases", color: AppColor.primaryBlack, font: Poppins.medium, size: 24)
    
    let newLabel = UILabel(text: "", color: AppColor.appGreen, font: Poppins.regular, size: 18)
    let activeLabel = UILabel(text: "", color: AppColor.textGray, font: Poppins.regular, size: 18)
    let criticalLabel = UILabel(text: "", color: AppColor.textGray, font: Poppins.regular, size: 18)
    let recoveredLabel = UILabel(text: "", color: AppColor.textGray, font: Poppins.regular, size: 18)
    let totalLabel = UILabel(text: "", color: AppColor.primary, font: Poppins.medium, size: 18)
    
    lazy var newDivider = getDivider()
    lazy var activeDivider = getDivider()
    lazy var criticalDivider = getDivider()
    lazy var recoveredDivider = getDivider()
    
    lazy var casesStack = VerticalStackView(arrangedSubViews: [newLabel, newDivider, activeLabel, activeDivider, criticalLabel, criticalDivider, recoveredLabel, recoveredDivider, totalLabel], spacing: 12, distribution: .fillProportionally)
    
    let deathsLabel = UILabel(text: "Deaths", color: AppColor.primaryBlack, font: Poppins.medium, size: 24)
    let newDeathsLabel = UILabel(text: "", color: AppColor.buttonPink, font: Poppins.regular, size: 18)
    let totalDeathLabel = UILabel(text: "", color: AppColor.primary, font: Poppins.medium, size: 18)
    
    lazy var deathDivider = getDivider()
    
    lazy var deathsStack = VerticalStackView(arrangedSubViews: [newDeathsLabel, deathDivider, totalDeathLabel], spacing: 12, distribution: .fillProportionally)
    
    private func getDivider() -> UIView {
        let view = UIView(color: AppColor.border)
        view.constraintHeight(constant: 0.3)
        return view
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupCasesView()
        setupDeathView()
    }
    
    private func setupCasesView() {
        addSubview(casesLabel)
        casesLabel.anchor(top: safeAreaLayoutGuide.topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 16, bottom: 0, right: 0))
        
        addSubview(casesStack)
        casesStack.anchor(top: casesLabel.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 14, left: 20, bottom: 0, right: 20))
    }
    
    private func setupDeathView() {
        addSubview(deathsLabel)
        deathsLabel.anchor(top: casesStack.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 30, left: 16, bottom: 0, right: 0))
        
        addSubview(deathsStack)
        deathsStack.anchor(top: deathsLabel.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 14, left: 20, bottom: 0, right: 20))
    }
    
    func configureData(data: StatisticsResponse) {
        configureCases(cases: data.cases)
        configureDeaths(deathCases: data.deaths)
    }
    
    private func configureCases(cases: StatisticsCases?) {
        guard let cases = cases else { return }
        let new = cases.new ?? ""
        newLabel.text = "\(new) New Cases"
        let active = String(cases.active ?? 0)
        activeLabel.text = "\(active) Active Cases"
        let critical = String(cases.critical ?? 0)
        criticalLabel.text = "\(critical) Critical Cases"
        let recovered = String(cases.recovered ?? 0)
        recoveredLabel.text = "\(recovered) Recovered Cases"
        let total = String(cases.total ?? 0)
        totalLabel.text = "\(total) Total Cases"
    }
    
    private func configureDeaths(deathCases: StatisticsDeaths?) {
        guard let deathCases = deathCases else { return }
        let new = deathCases.new ?? ""
        newDeathsLabel.text = "\(new) New Deaths"
        
        let total = String(deathCases.total ?? 0)
        totalDeathLabel.text = "\(total) Total Deaths"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
