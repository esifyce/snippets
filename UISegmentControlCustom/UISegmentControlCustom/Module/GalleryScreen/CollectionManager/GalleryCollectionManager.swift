//
//  GalleryCollectionManager.swift
//  UISegmentControlCustom
//
//  Created by Krasivo on 04.06.2023.
//

import UIKit

enum GalleryCellType {
    case galleryCell
}

protocol GalleryConfiguratorProtocol {
    var reuseId: String { get } // переменная для ячейки с reuse id
    var cellType: GalleryCellType { get } // тип ячейки для отработки нажатия
    func setupCell(_ cell: UIView) // настройка ячейки
}

final class GalleryConfigurator: GalleryConfiguratorProtocol {
    var reuseId: String { String(describing: GalleryCollectionViewCell.self) }
    var cellType: GalleryCellType = .galleryCell
    var model: GalleryViewModel?
    
    func setupCell(_ cell: UIView) {
        guard let cell = cell as? GalleryCollectionViewCell,
              let sectionModel = model else { return }
        cell.configureCell(viewModel: sectionModel)
    }
}

protocol GalleryCollectionManagerDelegate: AnyObject {
    func didGalleryTap()
}

protocol GalleryCollectionManagerProtocol: AnyObject {
    func injectCollection(_ collectionView: UICollectionView, delegate: GalleryCollectionManagerDelegate)
    func displayGallery(_ results: [GalleryViewModel])
}

final class GalleryCollectionManager: NSObject, GalleryCollectionManagerProtocol {
    // MARK: - Private properties
    private var collectionView: UICollectionView?
    private var configuratorsDataSource: [GalleryConfiguratorProtocol] = []
    weak var delegate: GalleryCollectionManagerDelegate?
    
    // MARK: - Public functions
    func injectCollection(_ collectionView: UICollectionView, delegate: GalleryCollectionManagerDelegate) {
        self.collectionView = collectionView
        self.collectionView?.dataSource = self
        self.collectionView?.delegate = self
        self.delegate = delegate
    }
    
    func displayGallery(_ results: [GalleryViewModel]) {
        var output: [GalleryConfiguratorProtocol] = []
        
        results.forEach({ galleryModel in
            output.append(gallerySectionConfigurator(with: galleryModel))
        })
        
        configuratorsDataSource = output.compactMap { $0 }
        collectionView?.collectionViewLayout = collectionItemLayout()
        registerForCells(viewModels: configuratorsDataSource)
        collectionView?.reloadData()
    }
    
    // MARK: - Private functions
    
    private func gallerySectionConfigurator(with model: GalleryViewModel) -> GalleryConfiguratorProtocol {
        let configurator = GalleryConfigurator()
        configurator.model = model
        return configurator
    }
    
    private func registerForCells(viewModels: [GalleryConfiguratorProtocol]) {
        let keys: Set<String> = Set(viewModels.map({ $0.reuseId }))
        keys.forEach { key in
            let objectClass: AnyClass? = NSClassFromString("UISegmentControlCustom." + key)
            guard let classType = objectClass as? UICollectionViewCell.Type else {
                return
            }
            self.collectionView?.register(classType, forCellWithReuseIdentifier: key)
        }
    }
}

extension GalleryCollectionManager: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        configuratorsDataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let configurator = configuratorsDataSource[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: configurator.reuseId,
                                                      for: indexPath)
        configurator.setupCell(cell)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let configurator = configuratorsDataSource[indexPath.row]
        switch configurator.cellType {
            case .galleryCell:
                delegate?.didGalleryTap()
        }
    }
    
    func collectionItemLayout() -> UICollectionViewLayout {
        let estimatedHeight: CGFloat = 222
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),  // Используем половину ширины контейнера для каждой ячейки
            heightDimension: .estimated(estimatedHeight))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),  // Занимаем всю ширину контейнера
            heightDimension: .estimated(estimatedHeight)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 2)
    
        group.interItemSpacing = .fixed(8)
                
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 8 // Отступ между рядами ячеек
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 16,
            leading: 16,
            bottom: 16,
            trailing: 16
        )
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}
