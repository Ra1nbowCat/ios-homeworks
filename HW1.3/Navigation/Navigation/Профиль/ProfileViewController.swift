//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Илья Лехов on 20.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var vc = ProfileHeaderView()
    
    override func viewWillLayoutSubviews() {
        vc.frame = view.frame
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Профиль"
        self.navigationController?.navigationBar.prefersLargeTitles = false
        // self.navigationController?.navigationBar.backgroundColor = .systemBlue
        self.navigationController?.navigationBar.isTranslucent = false
        self.view.backgroundColor = .lightGray
        
        
        
        // добавление как subview
        self.view.addSubview(vc)
        
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
