//
//  FeedViewController.swift
//  Navigation
//
//  Created by Илья Лехов on 20.02.2022.
//

import UIKit

class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Лента новостей"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
       let transitionButton = UIButton()
        transitionButton.layer.cornerRadius = 12
        transitionButton.setTitle("Переход на пост", for: .normal)
        transitionButton.backgroundColor = .systemBlue
        transitionButton.clipsToBounds = true
        transitionButton.addTarget(self, action: #selector(transitionScreen), for: .touchUpInside)
    
        transitionButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(transitionButton)
        
        NSLayoutConstraint.activate([
            transitionButton.widthAnchor.constraint(equalToConstant: 300),
            transitionButton.heightAnchor.constraint(equalToConstant: 50),
            transitionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            transitionButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        navigationItem.backButtonTitle = "Назад"
    
    }
    
    @objc private func transitionScreen(button: UINavigationItem) {
         let vc = PostViewController()
         vc.title = newPost.title
         vc.closure = {
             
         }
         self.navigationController?.pushViewController(vc, animated: true)
     }
    
    // Седьмое задание (+ сверху в функцию добавил!)
    struct Post {
        var title:String
    }
    
    var newPost =  Post(title: "Важная информация!")

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
