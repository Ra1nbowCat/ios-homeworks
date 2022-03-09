//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Илья Лехов on 20.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var vc = ProfileHeaderView()
    
    // решил убрать этот шаг, так как логинее получилось, что сама вьюха серая, а на Хедер я уже добавляю элементы, которые переносятся сюда
    /* override func viewWillLayoutSubviews() {
       vc.frame = view.frame
    } */

    override func loadView() {
        view = vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
