//
//  SomeConfigurator.swift
//  TestTableManager
//
//  Created by Krasivo on 17.05.2023.
//

import UIKit

enum ServiceCellType {
    case directionCell
    case categoryCell
    case locationCell
    case practiceCell
    case descriptionCell
    case photoCell
}

protocol ServiceConfiguratorProtocol {
    var reuseId: String { get } // переменная для ячейки с reuse id
    var cellType: ServiceCellType { get } // тип ячейки для отработки нажатия
    var cellHeight: CGFloat { get set } // высота ячейки
    func setupCell(_ cell: UIView) // настройка ячейки
    
    var textChanged: ((String) -> Void)? { get set }
    var firstPhotoBox: (() -> Void)? { get set }
    var secondPhotoBox: (() -> Void)? { get set }
    var thirdPhotoBox: (() -> Void)? { get set }
    var fourthPhotoBox: (() -> Void)? { get set }
}

final class ServiceConfigurator: ServiceConfiguratorProtocol {
    var reuseId: String { String(describing: SomeTableViewCell.self) }
    var model: ServiceModel?
    var cellType: ServiceCellType = .directionCell
    var cellHeight: CGFloat = 82
    var textChanged: ((String) -> Void)?
    var firstPhotoBox: (() -> Void)?
    var secondPhotoBox: (() -> Void)?
    var thirdPhotoBox: (() -> Void)?
    var fourthPhotoBox: (() -> Void)?
    
    func setupCell(_ cell: UIView) {
        guard let cell = cell as? SomeTableViewCell,
              let sectionModel = model else { return }
              cell.selectionStyle = .none
              cell.configureCell(model: sectionModel)
    }
}

final class DescriptionConfigurator: ServiceConfiguratorProtocol {
    
    var reuseId: String { String(describing: DescriptionTableViewCell.self) }
    var model: ServiceModel?
    var cellType: ServiceCellType = .descriptionCell
    var cellHeight: CGFloat = 96
    var textChanged: ((String) -> Void)? = { _ in }
    var firstPhotoBox: (() -> Void)?
    var secondPhotoBox: (() -> Void)?
    var thirdPhotoBox: (() -> Void)?
    var fourthPhotoBox: (() -> Void)?
    
    func setupCell(_ cell: UIView) {
        guard let cell = cell as? DescriptionTableViewCell,
              let sectionModel = model else { return }
        cell.selectionStyle = .none
        cell.configureCell(model: sectionModel)
        cell.textChanged = textChanged
    }
}

final class PhotoConfigurator: ServiceConfiguratorProtocol {
    
    var reuseId: String { String(describing: PhotoTableViewCell.self) }
    var model: ServiceModel?
    var cellType: ServiceCellType = .photoCell
    var cellHeight: CGFloat = 165
    var textChanged: ((String) -> Void)?
    var firstPhotoBox: (() -> Void)? = {}
    var secondPhotoBox: (() -> Void)? = {}
    var thirdPhotoBox: (() -> Void)? = {}
    var fourthPhotoBox: (() -> Void)? = {}
    
    func setupCell(_ cell: UIView) {
        guard let cell = cell as? PhotoTableViewCell,
              let sectionModel = model else { return }
        cell.selectionStyle = .none
        cell.configureCell(model: sectionModel)

        cell.firstPhotoCallback = firstPhotoBox
        cell.secondPhotoCallback = secondPhotoBox
        cell.thirdPhotoCallback = thirdPhotoBox
        cell.fourthPhotoCallback = fourthPhotoBox
    }
}

protocol ServiceTableManagerDelegate: AnyObject {
    func didDirectionTapped()
    func didCategoryTapped()
    func didLocationTapped()
    func didPracticeTapped()
}

protocol ServiceTableManagerProtocol: AnyObject {
    func injectTable(_ tableView: UITableView, delegate: ServiceTableManagerDelegate)
    func displayServiceResult(_ results: [ServiceModel])
}

final class ServiceTableManager: NSObject, ServiceTableManagerProtocol {
    // MARK: - Private properties
    private var tableView: UITableView?
    private var configuratorsDataSource: [ServiceConfiguratorProtocol] = []
    weak var delegate: ServiceTableManagerDelegate?
    
    // MARK: - Public functions
    func injectTable(_ tableView: UITableView, delegate: ServiceTableManagerDelegate) {
        self.tableView = tableView
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
        self.delegate = delegate
    }
    
    func displayServiceResult(_ results: [ServiceModel]) {
        guard results.count >= 6 else {
                print("Not enough results.")
                return
            }
            
        let relevantResults = results.prefix(6)
        
        var output: [ServiceConfiguratorProtocol] = []
        output.append(createServiceSectionConfigurator(with: relevantResults[0], cellType: .directionCell))
        output.append(createServiceSectionConfigurator(with: relevantResults[1], cellType: .categoryCell))
        output.append(createServiceSectionConfigurator(with: relevantResults[2], cellType: .locationCell))
        output.append(createServiceSectionConfigurator(with: relevantResults[3], cellType: .practiceCell))
        output.append(createDescriptionSectionConfigurator(with: relevantResults[4], cellHeight: 96))
        output.append(createPhotoSectionConfigurator(with: relevantResults[5]))
        
        configuratorsDataSource = output.compactMap { $0 }
        registerForCells(viewModels: configuratorsDataSource)
        tableView?.reloadData()
    }
    
    // MARK: - Private functions
    private func createServiceSectionConfigurator(with model: ServiceModel, cellType: ServiceCellType) -> ServiceConfiguratorProtocol {
        let configurator = ServiceConfigurator()
        configurator.model = model
        configurator.cellType = cellType
        return configurator
    }
    
    private func createDescriptionSectionConfigurator(with model: ServiceModel, cellHeight: CGFloat) -> ServiceConfiguratorProtocol {
        let configurator = DescriptionConfigurator()
        configurator.model = model
        configurator.cellHeight = cellHeight
        configurator.textChanged = { [weak self] text in
            let width = UIScreen.main.bounds.width - 75
            let textHeight = text.height(with: .systemFont(ofSize: 17), width: width) + 75

            guard
                let self,
                let index = self.configuratorsDataSource.firstIndex(where: { $0.cellType == .descriptionCell })
            else { return }

            self.configuratorsDataSource[index] = self.createDescriptionSectionConfigurator(with: model, cellHeight: textHeight)

            DispatchQueue.main.async {
                self.tableView?.beginUpdates()
                self.tableView?.endUpdates()
            }
        }
        return configurator
    }
    
    private func createPhotoSectionConfigurator(with model: ServiceModel) -> ServiceConfiguratorProtocol {
        let configurator = PhotoConfigurator()
        configurator.model = model
        return configurator
    }
    
    private func registerForCells(viewModels: [ServiceConfiguratorProtocol]) {
        let keys: Set<String> = Set(viewModels.map({ $0.reuseId }))
        keys.forEach { key in
            let objectClass: AnyClass?  = NSClassFromString( "TestTableManager." + key)
            guard let classType = objectClass as? UITableViewCell.Type else {
                return
            }
            self.tableView?.register(classType, forCellReuseIdentifier: key)
        }
    }
    
    private func heightForCell(text: String, font: UIFont, width: CGFloat) -> CGFloat {
       let label:UILabel = UILabel(frame: CGRectMake(0, 0, width, CGFloat.greatestFiniteMagnitude))
       label.numberOfLines = 0
       label.lineBreakMode = NSLineBreakMode.byWordWrapping
       label.font = font
       label.text = text

       label.sizeToFit()
       return label.frame.height
   }
}

extension ServiceTableManager: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        configuratorsDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let configurator = configuratorsDataSource[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: configurator.reuseId, for: indexPath)
        configurator.setupCell(cell)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentConfigurator = configuratorsDataSource[indexPath.row]
        switch currentConfigurator.cellType {
        case .directionCell:
            delegate?.didDirectionTapped()
        case .categoryCell:
            delegate?.didCategoryTapped()
        case .locationCell:
            delegate?.didLocationTapped()
        case .practiceCell:
            delegate?.didPracticeTapped()
        case .descriptionCell:
            break
        case .photoCell:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return max(0, configuratorsDataSource[indexPath.row].cellHeight)
    }
}

extension String {
    func width(with font: UIFont, height: CGFloat) -> CGFloat {
        width(with: font, height: height, maximumWidth: .greatestFiniteMagnitude)
    }
    
    func width(with font: UIFont, height: CGFloat, maximumWidth: CGFloat) -> CGFloat {
        let rect = CGSize(width: maximumWidth, height: height)
        let boundingBox = (self as NSString).boundingRect(with: rect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        
        return ceil(boundingBox.width)
    }
    
    func height(with font: UIFont, width: CGFloat) -> CGFloat {
        let rect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = (self as NSString).boundingRect(with: rect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        
        return ceil(boundingBox.height)
    }
}
