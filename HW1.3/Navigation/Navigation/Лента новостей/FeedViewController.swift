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
        view.backgroundColor = .lightGray
        self.navigationController?.navigationBar.isTranslucent = false
        title = "Лента новостей"
        self.navigationController?.navigationBar.prefersLargeTitles = false
        
        self.view.addSubview(buttonStackView)
        buttonStackView.addArrangedSubview(transitionButton)
        buttonStackView.addArrangedSubview(secondTransitionButton)
        addConstraintsToStackView()
        
        navigationItem.backButtonTitle = "Назад"
    
    }
    
    let transitionButton: UIButton = {
        let transitionButton = UIButton()
        transitionButton.layer.cornerRadius = 12
        transitionButton.setTitle("Переход на пост", for: .normal)
        transitionButton.backgroundColor = .systemBlue
        transitionButton.clipsToBounds = true
        transitionButton.addTarget(self, action: #selector(transitionScreen), for: .touchUpInside)
        transitionButton.translatesAutoresizingMaskIntoConstraints = false
        return transitionButton
    } ()
    
    let secondTransitionButton: UIButton = {
        let transitionButton = UIButton()
        transitionButton.layer.cornerRadius = 12
        transitionButton.setTitle("Второй переход", for: .normal)
        transitionButton.backgroundColor = .systemBlue
        transitionButton.clipsToBounds = true
        transitionButton.addTarget(self, action: #selector(transitionScreen), for: .touchUpInside)
        transitionButton.translatesAutoresizingMaskIntoConstraints = false
        return transitionButton
    } ()
    
    let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    } ()
    
    func addConstraintsToStackView() {
        NSLayoutConstraint.activate([
            buttonStackView.heightAnchor.constraint(equalToConstant: 110),
            buttonStackView.widthAnchor.constraint(equalToConstant: 300),
            buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
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
