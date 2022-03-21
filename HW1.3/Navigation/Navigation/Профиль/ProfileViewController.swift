//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Илья Лехов on 20.02.2022.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath)
          cell.textLabel?.text = posts[indexPath.row].description
          return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = vc
            return headerView
        }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 250    // вот здесь я хотел сделать не число, а прибить к vc.frame.height. Но почему-то у меня это значение оказывалось равно 0. Если не сложно, объясните этот момент в комментарии, пожалуйста.
        }
    
    
    
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
        
        postTableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
        postTableView.leftAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leftAnchor).isActive = true
        postTableView.rightAnchor.constraint(equalTo:view.safeAreaLayoutGuide.rightAnchor).isActive = true
        postTableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        postTableView.dataSource = self
        postTableView.delegate = self
        
        postTableView.register(UITableViewCell.self, forCellReuseIdentifier: "postCell")
    }
}
