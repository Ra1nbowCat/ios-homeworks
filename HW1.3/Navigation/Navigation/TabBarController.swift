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
            
            let FirstViewController = FeedViewController()  // пятое задание
            let firstNavigationController = UINavigationController(rootViewController: FirstViewController)
            
            let SecondViewController = ProfileViewController()   // пятое задание
            let secondNavigationController = UINavigationController(rootViewController: SecondViewController)
            
            viewControllers = [firstNavigationController, secondNavigationController]
            
            // Четвертый пункт
            self.tabBar.tintColor = UIColor.black
            self.tabBar.isTranslucent = false
            
            self.view.backgroundColor = .white
            
            let appearance = UITabBarItem.appearance()
            let attributes = [NSAttributedString.Key.font:UIFont(name: "TimesNewRomanPSMT", size: 15)]
            appearance.setTitleTextAttributes(attributes, for: .normal)
            
            firstNavigationController.tabBarItem.image = UIImage(systemName: "n.circle")
            firstNavigationController.tabBarItem.title = "Лента новостей"
            
            secondNavigationController.tabBarItem.image = UIImage(systemName: "list.dash")
            secondNavigationController.tabBarItem.title = "Профиль"
            
        }

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

