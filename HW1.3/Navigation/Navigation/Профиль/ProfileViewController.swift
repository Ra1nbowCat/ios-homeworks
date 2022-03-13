//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Илья Лехов on 20.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var vc = ProfileHeaderView()
    
    func activateConstraintsForView() {
        vc.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            vc.heightAnchor.constraint(equalToConstant: 220),
            vc.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            vc.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            vc.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
    }
    
    let bottomButtom: UIButton = {
        var button = UIButton()
        button.layer.cornerRadius = 4
        button.setTitle("Дополнительная кнопка", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 4.0
        button.layer.masksToBounds = false
        button.layer.cornerRadius = 4.0
        return button
    } ()
    
    func activateConstraintsForButton() {
        NSLayoutConstraint.activate([
            /*
             Вот констрейнты, нужные по заданию. Я немного сделал свои, чтобы выглядело лучше :)
             bottomButtom.leadingAnchor.constraint(equalTo: view.leadingAnchor),
             bottomButtom.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
             bottomButtom.trailingAnchor.constraint(equalTo: view.trailingAnchor)
             */
            bottomButtom.heightAnchor.constraint(equalToConstant: 50),
            bottomButtom.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            bottomButtom.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            bottomButtom.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(vc)
        view.addSubview(bottomButtom)
        activateConstraintsForView()
        activateConstraintsForButton()
        title = "Профиль"
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationController?.navigationBar.isTranslucent = false
        self.view.backgroundColor = .lightGray
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
