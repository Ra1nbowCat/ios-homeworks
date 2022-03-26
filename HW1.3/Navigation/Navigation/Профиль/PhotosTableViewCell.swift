//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Илья Лехов on 25.03.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    let mainLabel:UILabel = {
            let label = UILabel()
            label.textColor = .black
            label.text = "Photos"
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
            return label
    }()
    
    let firstPhotoImage:UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "first_meme")
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 6
        img.clipsToBounds = true
        return img
    }()
    
    let secondPhotoImage:UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "second_meme")
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 6
        img.clipsToBounds = true
        return img
    }()
    
    let thirdPhotoImage:UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "third_meme")
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 6
        img.clipsToBounds = true
        return img
    }()
    
    let fourthPhotoImage:UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "fourth_meme")
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 6
        img.clipsToBounds = true
        return img
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //self.contentView.backgroundColor = .systemRed
        self.contentView.addSubview(mainLabel)
        self.contentView.addSubview(firstPhotoImage)
        self.contentView.addSubview(secondPhotoImage)
        self.contentView.addSubview(thirdPhotoImage)
        self.contentView.addSubview(fourthPhotoImage)
        
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
     }

     required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }

}
