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
         transitionButton2.setTitle("Внимание!", for: .normal)
        transitionButton2.backgroundColor = .brown
         transitionButton2.clipsToBounds = true
        transitionButton2.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        
        
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
    
    @objc func showAlert() {
    let alert = UIAlertController(title: "Выбор!", message: "Какую таблетку вы выберете?", preferredStyle: .alert)

    alert.addAction(UIAlertAction(title: "Красную", style: .cancel) { _ in
        self.showThirdAlert()
    })
    alert.addAction(UIAlertAction(title: "Синюю", style: .default) { _ in
        self.showSecondAlert()
    })

    present(alert, animated: true)
        
    }
    
    func showSecondAlert() {
        let secondAlert = UIAlertController(title: nil, message: "Вы выбрали синюю таблетку и остались в матрице :(", preferredStyle: .alert)
        secondAlert.addAction(UIAlertAction(title: "Ну ок...", style: .cancel) { _ in
            
        })
        
        present(secondAlert, animated: true)
    }
    
    func showThirdAlert() {
        let thirdAlert = UIAlertController(title: nil, message: "Вы выбрали красную таблетку, ура!", preferredStyle: .alert)
        thirdAlert.addAction(UIAlertAction(title: "Пока, матрица!!!", style: .cancel) { _ in
            
        })
        
        present(thirdAlert, animated: true)
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
