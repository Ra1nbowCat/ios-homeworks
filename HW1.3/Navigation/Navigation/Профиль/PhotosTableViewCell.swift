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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(mainLabel)
        
        mainLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 12).isActive = true
        mainLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 12).isActive = true
     }

     required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }

}
