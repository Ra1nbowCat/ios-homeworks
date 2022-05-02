//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Илья Лехов on 25.03.2022.
//

import UIKit

protocol Delegate {
    func didTapPhotoButton()
}

class PhotosTableViewCell: UITableViewCell {
    
    var delegate: Delegate?
    
    @objc private func didTapPhotoButton() {
        self.delegate?.didTapPhotoButton()
    }

    private let mainLabel:UILabel = {
            let label = UILabel()
            label.textColor = .black
            label.text = "Photos"
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
            return label
    }()
    
    private let firstPhotoImage:UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "first_meme")
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 6
        img.clipsToBounds = true
        return img
    }()
    
    private let secondPhotoImage:UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "second_meme")
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 6
        img.clipsToBounds = true
        return img
    }()
    
    private let thirdPhotoImage:UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "third_meme")
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 6
        img.clipsToBounds = true
        return img
    }()
    
    private let fourthPhotoImage:UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "fourth_meme")
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 6
        img.clipsToBounds = true
        return img
    }()
    
    let photoButton: UIButton = {
        var button = UIButton()
        button.backgroundColor = .white
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(systemName: "arrow.right")
        button.setBackgroundImage(image, for: UIControl.State.normal)
        button.addTarget(self, action: #selector(didTapPhotoButton), for: .touchUpInside)
        return button
    } ()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        activateConstraints()
     }
    
    private func setupView() {
        self.contentView.addSubview(mainLabel)
        self.contentView.addSubview(firstPhotoImage)
        self.contentView.addSubview(secondPhotoImage)
        self.contentView.addSubview(thirdPhotoImage)
        self.contentView.addSubview(fourthPhotoImage)
        self.contentView.addSubview(photoButton)
    }
    
    private func activateConstraints() {
        mainLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 12).isActive = true
        mainLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 12).isActive = true
        mainLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        firstPhotoImage.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 12).isActive = true
        firstPhotoImage.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -12).isActive = true
        firstPhotoImage.leadingAnchor.constraint(equalTo: mainLabel.leadingAnchor).isActive = true
        
        secondPhotoImage.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 12).isActive = true
        secondPhotoImage.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -12).isActive = true
        secondPhotoImage.leadingAnchor.constraint(equalTo: firstPhotoImage.trailingAnchor, constant: 8).isActive = true
        
        thirdPhotoImage.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 12).isActive = true
        thirdPhotoImage.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -12).isActive = true
        thirdPhotoImage.leadingAnchor.constraint(equalTo: secondPhotoImage.trailingAnchor, constant: 8).isActive = true
        
        fourthPhotoImage.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 12).isActive = true
        fourthPhotoImage.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -12).isActive = true
        fourthPhotoImage.leadingAnchor.constraint(equalTo: thirdPhotoImage.trailingAnchor, constant: 8).isActive = true
        
        photoButton.centerYAnchor.constraint(equalTo: mainLabel.centerYAnchor).isActive = true
        photoButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -12).isActive = true
        photoButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        photoButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
        firstPhotoImage.widthAnchor.constraint(equalToConstant: (self.contentView.frame.maxX) / 4 - 12).isActive = true
        secondPhotoImage.widthAnchor.constraint(equalToConstant: (self.contentView.frame.maxX) / 4 - 12).isActive = true
        thirdPhotoImage.widthAnchor.constraint(equalToConstant: (self.contentView.frame.maxX) / 4 - 12).isActive = true
        fourthPhotoImage.widthAnchor.constraint(equalToConstant: (self.contentView.frame.maxX) / 4 - 12).isActive = true
    }
    
     required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
}
