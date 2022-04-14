//
//  TabBarController.swift
//  Navigation
//
//  Created by Илья Лехов on 20.02.2022.
//

import UIKit

class TabBarController: UITabBarController {
    
        override func viewDidLoad() {
            super.viewDidLoad()
            
            let firstViewController = FeedViewController()
            let firstNavigationController = UINavigationController(rootViewController: firstViewController)
            
            let secondViewController = LogInViewController()
            let secondNavigationController = UINavigationController(rootViewController: secondViewController)
            
            let thirdViewController = AnimationViewController()
            let thirdNavigationController = UINavigationController(rootViewController: thirdViewController)
            
            
            viewControllers = [firstNavigationController, secondNavigationController, thirdNavigationController]
            
            // Четвертый пункт
            self.tabBar.tintColor = UIColor.systemBlue
            self.tabBar.isTranslucent = false
            self.tabBar.unselectedItemTintColor = UIColor.darkText
            secondNavigationController.navigationBar.isHidden = true
            
            self.view.backgroundColor = .white
            
            let appearance = UITabBarItem.appearance()
            let attributes = [NSAttributedString.Key.font:UIFont(name: "TimesNewRomanPSMT", size: 15)]
            appearance.setTitleTextAttributes(attributes, for: .normal)
            
            firstNavigationController.tabBarItem.image = UIImage(systemName: "n.circle")
            firstNavigationController.tabBarItem.title = "Лента новостей"
            
            secondNavigationController.tabBarItem.image = UIImage(systemName: "list.dash")
            secondNavigationController.tabBarItem.title = "Профиль"
            
            thirdNavigationController.tabBarItem.image = UIImage(systemName: "scribble")
            thirdNavigationController.tabBarItem.title = "Анимация"
        }

    }
