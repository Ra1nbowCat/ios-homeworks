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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //self.contentView.backgroundColor = .systemRed
        self.contentView.addSubview(mainLabel)
        self.contentView.addSubview(firstPhotoImage)
        
        mainLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 12).isActive = true
        mainLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 12).isActive = true
        
        firstPhotoImage.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 12).isActive = true
        firstPhotoImage.leadingAnchor.constraint(equalTo: mainLabel.leadingAnchor).isActive = true
        firstPhotoImage.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -12).isActive = true
        firstPhotoImage.widthAnchor.constraint(equalToConstant: (self.contentView.frame.width) / 4 + 20).isActive = true
     }

     required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }

}
