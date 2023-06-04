//
//  AboutView.swift
//  UIAboutControlCustom
//
//  Created by Krasivo on 01.06.2023.
//

import UIKit

protocol AboutViewDelegate: AnyObject {
    func changedSwitchValue()
}

final class AboutView: ProfileBaseView {
    
    // MARK: - Property
    
    weak var delegate: AboutViewDelegate?
    
    // MARK: - Views
    
    private lazy var tableView: UITableView = {
       let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.bounces = false
        return tableView
    }()
    
    
    // MARK: - Init
    
    init(frame: CGRect,
         delegate: AboutViewDelegate) {
        self.delegate = delegate
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - private MasterProfileView
private extension AboutView {
    
    func configureUI() {
        tableView.backgroundColor = .clear
        addViews()
        addConstraints()
        setupTableView()
    }
    
    func addViews() {
        [tableView].forEach({ self.addSubview($0) })
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    @objc func switchChanged(mySwitch: UISwitch) {
        let value = mySwitch.isOn
        print(value)
        
        delegate?.changedSwitchValue()
    }
    
    func setupTableView() {
        configureHeader()
        configureFooter()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func configureHeader() {
        let headerView = setupHeader()
        headerView.frame = .init(x: .zero, y: .zero, width: tableView.frame.width, height: 400)
        tableView.tableHeaderView = headerView
    }
    
    func configureFooter() {
        let footerView = setupFooter()
        footerView.frame = .init(x: .zero, y: .zero, width: tableView.frame.width, height: 66)
        tableView.tableFooterView = footerView
        
    }
}

extension AboutView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "test"
        cell.backgroundColor = .clear
        return cell
    }
}
