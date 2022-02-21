//
//  InfoViewController.swift
//  Navigation
//
//  Created by Илья Лехов on 21.02.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    var closure: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        
        let transitionButton2 = UIButton()
         transitionButton2.layer.cornerRadius = 12
         transitionButton2.setTitle("Переход на пост", for: .normal)
        transitionButton2.backgroundColor = .brown
         transitionButton2.clipsToBounds = true
        
        
         transitionButton2.translatesAutoresizingMaskIntoConstraints = false
         self.view.addSubview(transitionButton2)
         
         NSLayoutConstraint.activate([
             transitionButton2.widthAnchor.constraint(equalToConstant: 300),
             transitionButton2.heightAnchor.constraint(equalToConstant: 50),
             transitionButton2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             transitionButton2.centerYAnchor.constraint(equalTo: view.bottomAnchor, constant: -75)
         ])

        // Do any additional setup after loading the view.
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
