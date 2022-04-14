//
//  LargePhotoViewController.swift
//  Navigation
//
//  Created by Илья Лехов on 13.04.2022.
//

import UIKit

class LargePhotoViewController: UIViewController {
    
    let largePhotoImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .red
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private func setupView() {
        view.addSubview(largePhotoImageView)
    }
    
    private func setupConstraints() {
        largePhotoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        largePhotoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        largePhotoImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        largePhotoImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
}
