//
//  TabBarCoordinator.swift
//  UpdateTabBarBySwitch
//
//  Created by Krasivo on 22.05.2023.
//

import UIKit

enum MasterTabBarPage {
    case home
    case profile
    case createService
    case messages
    case notes

    init?(index: Int) {
        switch index {
        case 0:
            self = .home
        case 1:
            self = .profile
        case 2:
            self = .createService
        case 3:
            self = .messages
        case 4:
            self = .notes
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
        case .createService:
            return "Новая услуга"
        case .messages:
            return "Сообщения"
        case .notes:
            return "Записи"
        }
    }

    func pageOrderNumber() -> Int {
        switch self {
        case .home:
            return 0
        case .profile:
            return 1
        case .createService:
            return 2
        case .messages:
            return 3
        case .notes:
            return 4
        }
    }

    // Add tab icon value
    
    func pageIconValue() -> UIImage {
        switch self {
        case .home:
            return UIImage(named: "masterHome")!
        case .profile:
            return UIImage(named: "masterProfile")!
        case .createService:
            return UIImage(named: "masterService")!
        case .messages:
            return UIImage(named: "masterMessage")!
        case .notes:
            return UIImage(named: "masterCalendar")!
        }
    }
    
    // Add tab icon selected / deselected color
    
    // etc
}


protocol MasterTabCoordinatorProtocol: Coordinator {
    var tabBarController: UITabBarController { get set }
    
    func selectPage(_ page: MasterTabBarPage)
    
    func setSelectedIndex(_ index: Int)
    
    func currentPage() -> MasterTabBarPage?
}

class MasterTabCoordinator: NSObject, Coordinator {
    weak var finishDelegate: CoordinatorFinishDelegate?
        
    var childCoordinators: [Coordinator] = []

    var navigationController: UINavigationController
    
    var tabBarController: UITabBarController

    var type: CoordinatorType { .master }
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.tabBarController = .init()
    }

    func start() {
        // Let's define which pages do we want to add into tab bar
        let pages: [MasterTabBarPage] = [.home, .profile, .createService, .messages, .notes]
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
        tabBarController.selectedIndex = MasterTabBarPage.home.pageOrderNumber()
        /// Styling
        tabBarController.tabBar.isTranslucent = false
        
        /// In this step, we attach tabBarController to navigation controller associated with this coordanator
        navigationController.viewControllers = [tabBarController]
    }
      
    private func getTabController(_ page: MasterTabBarPage) -> UINavigationController {
        let navController = UINavigationController()
        navController.setNavigationBarHidden(false, animated: false)

        navController.tabBarItem = UITabBarItem.init(title: nil,
                                                     image: page.pageIconValue(),
                                                     tag: page.pageOrderNumber())
        navController.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0.0, vertical: -10.0)
        UITabBar.appearance().tintColor = UIColor.red
        
        
        switch page {
        case .home:
            let homeVC = MasterHomeViewController()
            navController.pushViewController(homeVC, animated: true)
        case .profile:
            let profileVC = MasterProfileViewController()
            profileVC.didSendEventClosure = { [weak self] in
                self?.finish()
            }
            navController.pushViewController(profileVC, animated: true)
        case .createService:
            let createServiceVC = MasterFolderViewController()
            navController.pushViewController(createServiceVC, animated: true)
        case .messages:
            let messagesVC = MasterMessageViewController()
            navController.pushViewController(messagesVC, animated: true)
        case .notes:
            let notesVC = MasterCalendarViewController()
            navController.pushViewController(notesVC, animated: true)
        }
        return navController
    }
    
    func currentPage() -> MasterTabBarPage? { MasterTabBarPage.init(index: tabBarController.selectedIndex) }

    func selectPage(_ page: MasterTabBarPage) {
        tabBarController.selectedIndex = page.pageOrderNumber()
    }
    
    func setSelectedIndex(_ index: Int) {
        guard let page = MasterTabBarPage.init(index: index) else { return }
        
        tabBarController.selectedIndex = page.pageOrderNumber()
    }
}

// MARK: - UITabBarControllerDelegate
extension MasterTabCoordinator: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController,
                          didSelect viewController: UIViewController) {
        // Some implementation
    }
}
