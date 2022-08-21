//
//  ChartsViewController.swift
//  BarLineChart
//
//  Created by Krasivo on 21.08.2022.
//

import UIKit

class ChartsViewController: UIViewController {
    
    // MARK: - Property
    
    let viewModel: ChartsViewModelProtocol
    
    // MARK: - Views
    
    let lineChart: LineChart = {
       let chart = LineChart()
        chart.translatesAutoresizingMaskIntoConstraints = false
        return chart
    }()

    let curvedlineChart: LineChart = {
       let chart = LineChart()
        chart.translatesAutoresizingMaskIntoConstraints = false
        return chart
    }()
    
    // MARK: - Init
    
    init(viewModel: ChartsViewModelProtocol = ChartsViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle VC
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    
        lineChart.dataEntries = viewModel.dataEntries
        lineChart.isCurved = false
        
        curvedlineChart.dataEntries = viewModel.dataEntries
        curvedlineChart.isCurved = true
    }
    
    // MARK: - Selectors
    
    // MARK: - Configure
    
    private func configure() {
        setupViews()
        setupConstraints()
        
        view.backgroundColor = #colorLiteral(red: 0, green: 0.3529411765, blue: 0.6156862745, alpha: 1)
    }
    
    private func setupViews() {
        view.addSubview(lineChart)
        view.addSubview(curvedlineChart)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            lineChart.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            lineChart.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            lineChart.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            lineChart.heightAnchor.constraint(equalToConstant: 300),
            
            curvedlineChart.topAnchor.constraint(equalTo: lineChart.bottomAnchor, constant: 50),
            curvedlineChart.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            curvedlineChart.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            curvedlineChart.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
}
