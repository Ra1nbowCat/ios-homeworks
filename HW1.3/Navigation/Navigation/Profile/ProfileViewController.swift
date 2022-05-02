//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Илья Лехов on 20.02.2022.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "photoCell") as! PhotosTableViewCell
            cell.selectionStyle = .none
            cell.delegate = self
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostTableViewCell
        cell.post = posts[indexPath.row]
        cell.selectionStyle = .none
          return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = vc
            return headerView
        }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 150
        }
       return 550
    }
    
    
    private var vc = ProfileHeaderView()
    private var posts = PostAPI().posts
    private let postTableView = UITableView()
    private let navVC = UINavigationController(rootViewController: PhotosViewController())
    
    private func activateConstraintsForView() {
        vc.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            vc.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            vc.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            vc.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(postTableView)
        postTableView.translatesAutoresizingMaskIntoConstraints = false
        vc.backgroundColor = .white
        
        postTableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
        postTableView.leftAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leftAnchor).isActive = true
        postTableView.rightAnchor.constraint(equalTo:view.safeAreaLayoutGuide.rightAnchor).isActive = true
        postTableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        postTableView.dataSource = self
        postTableView.delegate = self
        
        postTableView.register(PostTableViewCell.self, forCellReuseIdentifier: "postCell")
        postTableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "photoCell")
    }
}

extension ProfileViewController: Delegate {
    func didTapPhotoButton() {
        navVC.delegate = self
        navVC.modalPresentationStyle = .fullScreen
        self.present(navVC, animated: true)
    }
}
