//
//  AnimationViewController.swift
//  Navigation
//
//  Created by Илья Лехов on 01.04.2022.
//

import UIKit

class AnimationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        addConstraintsToView()
    }
    
    let marioImageView: UIImageView = {
        var imageView : UIImageView
        imageView  = UIImageView(frame: CGRect(x: 16, y: 16, width: 150, height: 150))
           imageView.image = UIImage(named:"mario_logo")
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    } ()
    
    func addConstraintsToView() {
        NSLayoutConstraint.activate([
            marioImageView.widthAnchor.constraint(equalToConstant: 150),
            marioImageView.heightAnchor.constraint(equalToConstant: 150),
            marioImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            marioImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16)
            ])
    }
    
    func setupViews() {
        view.addSubview(marioImageView)
    }
}
