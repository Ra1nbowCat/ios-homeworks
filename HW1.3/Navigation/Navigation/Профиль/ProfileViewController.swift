//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Илья Лехов on 20.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var vc = ProfileHeaderView()
    private let posts = PostAPI.getPost()
    let postTableView = UITableView()
    
    func activateConstraintsForView() {
        vc.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            vc.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            vc.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            vc.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
    }
    
    func activateConstraintsForTableView() {
        NSLayoutConstraint.activate([
            postTableView.topAnchor.constraint(equalTo: view.topAnchor),
            postTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            postTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            postTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        view.addSubview(vc)
        activateConstraintsForView()
        title = "Профиль"
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationController?.navigationBar.isTranslucent = false
        self.view.backgroundColor = .systemGray4 */
        
        view.addSubview(postTableView)
        postTableView.translatesAutoresizingMaskIntoConstraints = false
        activateConstraintsForTableView()
    }
}
