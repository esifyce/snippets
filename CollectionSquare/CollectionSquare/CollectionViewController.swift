//
//  CollectionViewController.swift
//  CollectionSquare
//
//  Created by Krasivo on 26.05.2023.
//

import UIKit

class CollectionViewController: UIViewController {

    private var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor(red: 0.967, green: 0.954, blue: 0.94, alpha: 1)
//        // Создаем композиционный макет

        setupCollectionView()
    }
    
    private func setupCollectionView() {
         let layout = UICollectionViewCompositionalLayout { (section, environment) -> NSCollectionLayoutSection? in
             // Определяем размеры ячейки и группы
             let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.25), heightDimension: .absolute(82))
             let item = NSCollectionLayoutItem(layoutSize: itemSize)
             item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
             
             let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(82))
             let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 4)
             
             let section = NSCollectionLayoutSection(group: group)
             section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
             
             return section
         }
         
         collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
         collectionView.dataSource = self
         collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
         collectionView.backgroundColor = .white
         view.addSubview(collectionView)
     }
    
    
}

extension CollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 16 // Количество ячеек, которое вы хотите отобразить
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        // Настройка ячейки, например, установка фона или отображение контента
        
        return cell
    }
}
