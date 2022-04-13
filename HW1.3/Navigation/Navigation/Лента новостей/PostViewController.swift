//
//  PostViewController.swift
//  Navigation
//
//  Created by Илья Лехов on 20.02.2022.
//

import UIKit

//шестое задание

class PostViewController: UIViewController {

    private var closure: (() -> Void)? 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemCyan
        self.navigationController?.navigationBar.tintColor = .darkText
        self.navigationController?.navigationBar.prefersLargeTitles = false
        var newButton = UIBarButtonItem(title: "Информация", style: .plain, target: self, action: #selector(transitionScreen))
        navigationItem.rightBarButtonItem = newButton
        navigationItem.backButtonTitle = "Назад"
    }
    
    @objc private func transitionScreen() {
        let vc2 = InfoViewController()
        let navigationController = UINavigationController(rootViewController: vc2)
        navigationController.modalPresentationStyle = UIModalPresentationStyle.automatic
        self.present(navigationController, animated: true, completion: nil)
     }
}
