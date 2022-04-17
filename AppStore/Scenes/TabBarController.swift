import UIKit

class TabBarController: UITabBarController {
    
    private lazy var todayViewController: UIViewController = { // 임의로 만들어 둠
        let viewController = TodayViewController()
        let tabBarItem = UITabBarItem(title: "투데이", image: UIImage(systemName: "mail"), tag: 0) // 탭의 Item을 설정함
        
        viewController.tabBarItem = tabBarItem
        
        return viewController
    }()
    
    private lazy var appViewController: UIViewController = {
        let viewController = UINavigationController(rootViewController: AppViewController())
        let tabBarItem = UITabBarItem(title: "앱", image: UIImage(systemName: "square.stack.3d.up"), tag: 1) // 탭의 Item을 설정함
        
        viewController.tabBarItem = tabBarItem
        
        return viewController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UITabBarController의 탭 개수를 나타냄
        viewControllers = [todayViewController, appViewController]
    }


}
