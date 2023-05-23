//
//  ClientTabBarCoordinator.swift
//  UpdateTabBarBySwitch
//
//  Created by Krasivo on 22.05.2023.
//

import UIKit

enum СlientTabBarPage {
    case home
    case profile
    case search
    case message
    case favorite

    init?(index: Int) {
        switch index {
        case 0:
            self = .home
        case 1:
            self = .profile
        case 2:
            self = .search
        case 3:
            self = .message
        case 4:
            self = .favorite
        default:
            return nil
        }
    }
    
    func pageTitleValue() -> String {
        switch self {
        case .home:
            return "Главная"
        case .profile:
            return "Профиль"
        case .search:
            return "Поиск"
        case .message:
            return "Сообщения"
        case .favorite:
            return "Избранное"
        }
    }

    func pageOrderNumber() -> Int {
        switch self {
        case .home:
            return 0
        case .profile:
            return 1
        case .search:
            return 2
        case .message:
            return 3
        case .favorite:
            return 4
        }
    }

    // Add tab icon value
    
    func pageIconValue() -> UIImage {
        switch self {
        case .home:
            return UIImage(named: "clientHome")!
        case .profile:
            return UIImage(named: "clientProfile")!
        case .search:
            return UIImage(named: "clientSearch")!
        case .message:
            return UIImage(named: "clientMessage")!
        case .favorite:
            return UIImage(named: "clientFavorite")!
        }
    }
    
    // Add tab icon selected / deselected color
    
    // etc
}


protocol ClientTabCoordinatorProtocol: Coordinator {
    var tabBarController: UITabBarController { get set }
    
    func selectPage(_ page: СlientTabBarPage)
    
    func setSelectedIndex(_ index: Int)
    
    func currentPage() -> СlientTabBarPage?
}

class ClientTabCoordinator: NSObject, Coordinator {
    weak var finishDelegate: CoordinatorFinishDelegate?
        
    var childCoordinators: [Coordinator] = []

    var navigationController: UINavigationController
    
    var tabBarController: UITabBarController

    var type: CoordinatorType { .client }
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.tabBarController = .init()
    }

    func start() {
        // Let's define which pages do we want to add into tab bar
        let pages: [СlientTabBarPage] = [.home, .profile, .search, .message, .favorite]
            .sorted(by: { $0.pageOrderNumber() < $1.pageOrderNumber() })
        
        // Initialization of ViewControllers or these pages
        let controllers: [UINavigationController] = pages.map({ getTabController($0) })
        
        tabBarController.tabBar.isTranslucent = true
        tabBarController.tabBar.backgroundImage = UIImage()
        tabBarController.tabBar.shadowImage = UIImage()
        tabBarController.tabBar.barTintColor = .clear
        tabBarController.tabBar.backgroundColor = .white
        tabBarController.tabBar.layer.backgroundColor = UIColor.clear.cgColor
        
        let blurEffect = UIBlurEffect(style: .regular)
        let blurView = UIVisualEffectView(effect: blurEffect)

        blurView.frame = tabBarController.tabBar.bounds
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        tabBarController.tabBar.insertSubview(blurView, at: 0)
        
        prepareTabBarController(withTabControllers: controllers)
    }
    
    deinit {
        print("TabCoordinator deinit")
    }
    
    private func prepareTabBarController(withTabControllers tabControllers: [UIViewController]) {
        /// Set delegate for UITabBarController
        tabBarController.delegate = self
        /// Assign page's controllers
        tabBarController.setViewControllers(tabControllers, animated: true)
        /// Let set index
        tabBarController.selectedIndex = СlientTabBarPage.home.pageOrderNumber()
        /// Styling
        tabBarController.tabBar.isTranslucent = false
        
        /// In this step, we attach tabBarController to navigation controller associated with this coordanator
        navigationController.viewControllers = [tabBarController]
    }
      
    private func getTabController(_ page: СlientTabBarPage) -> UINavigationController {
        let navController = UINavigationController()
        navController.setNavigationBarHidden(false, animated: false)

        navController.tabBarItem = UITabBarItem.init(title: nil,
                                                     image: page.pageIconValue(),
                                                     tag: page.pageOrderNumber())
        navController.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0.0, vertical: -10.0)
        UITabBar.appearance().tintColor = UIColor.red
        

        switch page {
        case .home:
            let homeVC = ClientHomeViewController()
            navController.pushViewController(homeVC, animated: true)
        case .profile:
            let profileVC = ClientProfileViewController()
            profileVC.didSendEventClosure = { [weak self] in
                self?.finish()
            }
            navController.pushViewController(profileVC, animated: true)
        case .search:
            let searchVC = ClientSearchViewController()
            navController.pushViewController(searchVC, animated: true)
        case .message:
            let messageVC = ClientMessageViewController()
            navController.pushViewController(messageVC, animated: true)
        case .favorite:
            let favoriteVC = ClientFavoriteViewController()
            navController.pushViewController(favoriteVC, animated: true)
        }
        return navController
    }
    
    func currentPage() -> СlientTabBarPage? { СlientTabBarPage.init(index: tabBarController.selectedIndex) }

    func selectPage(_ page: СlientTabBarPage) {
        tabBarController.selectedIndex = page.pageOrderNumber()
    }
    
    func setSelectedIndex(_ index: Int) {
        guard let page = СlientTabBarPage.init(index: index) else { return }
        
        tabBarController.selectedIndex = page.pageOrderNumber()
    }
}

// MARK: - UITabBarControllerDelegate
extension ClientTabCoordinator: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController,
                          didSelect viewController: UIViewController) {
        // Some implementation
    }
}
