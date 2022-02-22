//
//  PostViewController.swift
//  Navigation
//
//  Created by Илья Лехов on 20.02.2022.
//

import UIKit

//шестое задание

class PostViewController: UIViewController {

    var closure: (() -> Void)? 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemCyan
        self.navigationController?.navigationBar.tintColor = .darkText
        self.navigationController?.navigationBar.prefersLargeTitles = true
        var newButton = UIBarButtonItem(title: "Информация", style: .plain, target: self, action: #selector(transitionScreen))
        navigationItem.rightBarButtonItem = newButton
        navigationItem.backButtonTitle = "Назад"
    }
    
    @objc private func transitionScreen() {
         let vc2 = InfoViewController()
         vc2.closure = {
             
         }
         //navigationController?.pushViewController(vc2, animated: true)
        
        let navigationController = UINavigationController(rootViewController: vc2)
        navigationController.modalPresentationStyle = UIModalPresentationStyle.automatic
        self.present(navigationController, animated: true, completion: nil)
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
