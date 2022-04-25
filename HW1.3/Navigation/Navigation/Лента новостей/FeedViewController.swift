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
        title = "Feed"
        self.navigationController?.navigationBar.prefersLargeTitles = false
        
        self.view.addSubview(buttonStackView)
        buttonStackView.addArrangedSubview(transitionButton)
        buttonStackView.addArrangedSubview(secondTransitionButton)
        addConstraintsToStackView()
        
        navigationItem.backButtonTitle = "back"
    
    }
    
    private let transitionButton: UIButton = {
        let transitionButton = UIButton()
        transitionButton.layer.cornerRadius = 12
        transitionButton.setTitle("Переход на пост", for: .normal)
        transitionButton.backgroundColor = .systemBlue
        transitionButton.clipsToBounds = true
        transitionButton.addTarget(self, action: #selector(transitionScreen), for: .touchUpInside)
        transitionButton.translatesAutoresizingMaskIntoConstraints = false
        return transitionButton
    } ()
    
    private let secondTransitionButton: UIButton = {
        let transitionButton = UIButton()
        transitionButton.layer.cornerRadius = 12
        transitionButton.setTitle("Второй переход", for: .normal)
        transitionButton.backgroundColor = .systemBlue
        transitionButton.clipsToBounds = true
        transitionButton.addTarget(self, action: #selector(transitionScreen), for: .touchUpInside)
        transitionButton.translatesAutoresizingMaskIntoConstraints = false
        return transitionButton
    } ()
    
    private let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    } ()
    
    private func addConstraintsToStackView() {
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
         self.navigationController?.pushViewController(vc, animated: true)
     }
    
    private struct Post {
        var title:String
    }
    
    private var newPost =  Post(title: "Важная информация!")
}
