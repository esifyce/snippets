//
//  ChartsViewController.swift
//  BarChart
//
//  Created by Krasivo on 21.08.2022.
//

import UIKit

class ChartsViewController: UIViewController {
    
    // MARK: - Property
    
    let viewModel: ChartsViewModelProtocol
    
    // MARK: - Views
    
    let curveChartView: CurveBarChart = {
       let chart = CurveBarChart()
        chart.translatesAutoresizingMaskIntoConstraints = false
        return chart
    }()
    
    let rectangleChartView: RectangleBarChart = {
       let chart = RectangleBarChart()
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
    
        curveChartView.updateDataEntries(dataEntries: viewModel.dataEntries, animated: true)
        rectangleChartView.updateDataEntries(dataEntries: viewModel.dataEntries, animated: true)
    }
    
    // MARK: - Selectors
    
    // MARK: - Configure
    
    private func configure() {
        setupViews()
        setupConstraints()
        setupNotificationTarget()
        
        view.backgroundColor = .lightGray
    }
    
    private func setupViews() {
        view.addSubview(curveChartView)
        view.addSubview(rectangleChartView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            curveChartView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            curveChartView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            curveChartView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            curveChartView.heightAnchor.constraint(equalToConstant: 300),
            
            rectangleChartView.topAnchor.constraint(equalTo: curveChartView.bottomAnchor, constant: 50),
            rectangleChartView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            rectangleChartView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            rectangleChartView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    private func setupNotificationTarget() {
        
    }
    
    // MARK: - Helpers

}
