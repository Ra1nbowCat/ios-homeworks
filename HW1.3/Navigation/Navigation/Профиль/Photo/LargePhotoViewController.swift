//
//  LargePhotoViewController.swift
//  Navigation
//
//  Created by Илья Лехов on 13.04.2022.
//

import UIKit

class LargePhotoViewController: UIViewController {
    
    let photoImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .red
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let newButton: UIButton = {
        var button = UIButton()
        button.alpha = 1
        button.backgroundColor = .red
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(systemName: "power.circle")
        button.setBackgroundImage(image, for: UIControl.State.normal)
        return button
    } ()
    
    private func setupView() {
        view.addSubview(photoImageView)
        view.addSubview(newButton)
    }
    
    private func setupConstraints() {
        photoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        photoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        photoImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        photoImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        newButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        newButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
}
