//
//  TabBarCoordinator.swift
//  TabBarCoordinator
//
//  Created by Krasivo on 27.03.2023.
//

import UIKit

enum TabBarPage {
    case peopleAround
    case filter
    case output
    case profile
    case chats

    init?(index: Int) {
        switch index {
        case 0:
            self = .peopleAround
        case 1:
            self = .filter
        case 2:
            self = .output
        case 3:
            self = .profile
        case 4:
            self = .chats
        default:
            return nil
        }
    }
    
    func pageTitleValue() -> String {
        switch self {
        case .peopleAround:
            return "peopleAround"
        case .filter:
            return "filter"
        case .output:
            return "output"
        case .profile:
            return "profile"
        case .chats:
            return "chats"
        }
    }

    func pageOrderNumber() -> Int {
        switch self {
        case .peopleAround:
            return 0
        case .filter:
            return 1
        case .output:
            return 2
        case .profile:
            return 3
        case .chats:
            return 4
        }
    }

    // Add tab icon value
    
    func pageIconValue() -> UIImage {
        switch self {
        case .peopleAround:
            return UIImage(named: "peopleAroundTab")!
        case .filter:
            return UIImage(named: "filterAroundBar")!
        case .output:
            return UIImage(named: "cardsTab")!
        case .profile:
            return UIImage(named: "peopleAroundTab")!
        case .chats:
            return UIImage(named: "filterAroundBar")!
        }
    }
    
    // Add tab icon selected / deselected color
    
    // etc
}


protocol TabCoordinatorProtocol: Coordinator {
    var tabBarController: UITabBarController { get set }
    
    func selectPage(_ page: TabBarPage)
    
    func setSelectedIndex(_ index: Int)
    
    func currentPage() -> TabBarPage?
}

class TabCoordinator: NSObject, Coordinator {
    weak var finishDelegate: CoordinatorFinishDelegate?
        
    var childCoordinators: [Coordinator] = []

    var navigationController: UINavigationController
    
    var tabBarController: UITabBarController

    var type: CoordinatorType { .tab }
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.tabBarController = .init()
    }

    func start() {
        // Let's define which pages do we want to add into tab bar
        let pages: [TabBarPage] = [.peopleAround, .filter, .output, .profile, .chats]
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
        tabBarController.selectedIndex = TabBarPage.output.pageOrderNumber()
        /// Styling
        tabBarController.tabBar.isTranslucent = false
        
        /// In this step, we attach tabBarController to navigation controller associated with this coordanator
        navigationController.viewControllers = [tabBarController]
    }
      
    private func getTabController(_ page: TabBarPage) -> UINavigationController {
        let navController = UINavigationController()
        navController.setNavigationBarHidden(false, animated: false)

        navController.tabBarItem = UITabBarItem.init(title: nil,
                                                     image: page.pageIconValue(),
                                                     tag: page.pageOrderNumber())
        navController.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0.0, vertical: -10.0)
        UITabBar.appearance().tintColor = UIColor.red
        

        switch page {
        case .peopleAround:
            let peopleAroundVC = PeopleAroundViewController()
            navController.pushViewController(peopleAroundVC, animated: true)
        case .filter:
            let filterVC = FilterViewController()
            navController.pushViewController(filterVC, animated: true)
        case .output:
            let outputVC = OutputViewController()
            navController.pushViewController(outputVC, animated: true)
        case .profile:
            let profileVC = ProfileViewController()
            navController.pushViewController(profileVC, animated: true)
        case .chats:
            let chatsVC = ChatsViewController()
            navController.pushViewController(chatsVC, animated: true)
        }
        return navController
    }
    
    func currentPage() -> TabBarPage? { TabBarPage.init(index: tabBarController.selectedIndex) }

    func selectPage(_ page: TabBarPage) {
        tabBarController.selectedIndex = page.pageOrderNumber()
    }
    
    func setSelectedIndex(_ index: Int) {
        guard let page = TabBarPage.init(index: index) else { return }
        
        tabBarController.selectedIndex = page.pageOrderNumber()
    }
}

// MARK: - UITabBarControllerDelegate
extension TabCoordinator: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController,
                          didSelect viewController: UIViewController) {
        // Some implementation
    }
}

extension UIImage {

    func applyBlur(radius: CGFloat) -> UIImage? {
        let context = CIContext(options: nil)
        let inputImage = CIImage(image: self)

        guard let filter = CIFilter(name: "CIGaussianBlur") else { return nil }
        filter.setValue(inputImage, forKey: kCIInputImageKey)
        filter.setValue(radius, forKey: kCIInputRadiusKey)

        guard let outputImage = filter.outputImage,
              let cgImage = context.createCGImage(outputImage, from: inputImage!.extent) else { return nil }

        return UIImage(cgImage: cgImage)
    }
}
