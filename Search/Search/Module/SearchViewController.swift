//
//  ViewController.swift
//  Search
//
//  Created by Krasivo on 31.05.2023.
//

import UIKit

class SearchViewController: UIViewController {
    
    let listService: [String] = [
        "наращивание ногтей", "педикюр", "пилинг", "стрижки", "колорирование", "визаж", "ультразвуковой пилинг", "окраска бровей", "наращивание ресниц", "мехенди", "термаж лица", "колорирование", "татуаж бровей"]
    
    
    var searchBarTrailingConstraint: NSLayoutConstraint!
    var searchButtonTrailingConstraint: NSLayoutConstraint!
    
    private let cellReuseIdentifier = "CellReuseIdentifier"
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        collectionView.collectionViewLayout = collectionItemLayout()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    func collectionItemLayout() -> UICollectionViewLayout {
        let estimatedHeight: CGFloat = 20
        let estimatedWidth: CGFloat = 50

        let itemSize = NSCollectionLayoutSize(
            widthDimension: .estimated(estimatedWidth),
            heightDimension: .absolute(estimatedHeight)
        )
        // height is absolute because I know it, and in some cases not in this one,
        // though I have to calculate the height of UICollectionView
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        item.edgeSpacing = NSCollectionLayoutEdgeSpacing(
            leading: .fixed(0),
            top: .fixed(6),
            trailing: .fixed(6),
            bottom: .fixed(8)
        )

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(estimatedHeight)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        group.contentInsets = NSDirectionalEdgeInsets(
            top: 0,
            leading: 12,
            bottom: 0,
            trailing: 12
        )

        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 16

        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.tintColor = .green
        searchBar.searchTextField.clearButtonMode = .never
        searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: "Search", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.3)])
        searchBar.backgroundImage = UIImage()
        searchBar.delegate = self
        return searchBar
    }()
    
    private lazy var findButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Найти", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentEdgeInsets = UIEdgeInsets(top: 7, left: 9, bottom: 7, right: 9)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = false
        button.isHidden = true
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureUI()
        
    }
}

extension SearchViewController {
    
    func setupCollectionView() {
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    
    func setupSearchBar() {
        if let textField = searchBar.value(forKey: "searchField") as? UITextField {
            textField.backgroundColor = .white
            
            let backgroundView = textField.subviews.first
            if #available(iOS 11.0, *) { // If `searchController` is in `navigationItem`
                backgroundView?.backgroundColor = UIColor.white.withAlphaComponent(0.3)
                backgroundView?.subviews.forEach({ $0.removeFromSuperview() })
            }
            backgroundView?.layer.cornerRadius = 10.5
            backgroundView?.layer.masksToBounds = true
        }
    }
    
    func configureUI() {
        setupCollectionView()
        setupSearchBar()
        
        self.view.backgroundColor = .lightGray
        self.view.addSubview(searchBar)
        self.view.addSubview(findButton)
        view.addSubview(collectionView)
        
        searchBarTrailingConstraint = searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        searchBarTrailingConstraint.isActive = true
        searchButtonTrailingConstraint = findButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 16)
        searchButtonTrailingConstraint.isActive = true
        
        NSLayoutConstraint.activate([
            searchBarTrailingConstraint,
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 36),
            
            searchButtonTrailingConstraint,
            findButton.topAnchor.constraint(equalTo: searchBar.topAnchor),
            findButton.heightAnchor.constraint(equalTo: searchBar.heightAnchor),
            
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 20),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension SearchViewController: UISearchBarDelegate {
    // Обработка изменений в тексте searchbar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        var isFindButtonHidden = true
        if searchText.isEmpty {
            searchBarTrailingConstraint.constant = 0
            searchButtonTrailingConstraint.constant = 0
            findButton.isHidden = isFindButtonHidden
            collectionView.isHidden = !isFindButtonHidden
            searchBar.searchTextField.clearButtonMode = .never
        } else {
            searchBarTrailingConstraint.constant = -84
            searchButtonTrailingConstraint.constant = -16
            isFindButtonHidden = false
        }
        
        updateSearchBar(isHidden: isFindButtonHidden)
    }
    
    func updateSearchBar(isHidden: Bool) {
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        } completion: { [weak self] _ in
            self?.findButton.isHidden = isHidden
            self?.collectionView.isHidden = !isHidden
            self?.searchBar.searchTextField.clearButtonMode = .always
        }
    }
}

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listService.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! CustomCell
        cell.label.text = listService[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        searchBar.text = listService[indexPath.row]
        searchBarTrailingConstraint.constant = -84
        searchButtonTrailingConstraint.constant = -16
      //  searchBar.searchTextField.clearButtonMode = .always
        updateSearchBar(isHidden: false)
    }

}
