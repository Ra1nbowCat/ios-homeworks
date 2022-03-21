//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Илья Лехов on 21.03.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    
    var post:Post? {
        didSet {
            guard let postItem = post else {return}
            if let author = postItem.author {
                authorLabel.text = " \(author) "
            }
            
            if let name = postItem.image {
                postImageView.image = UIImage(named: name)
            }
            
            if let description = postItem.description {
                descriptionLabel.text = " Comment: \(description) "
            }
        }
    }
    
    let postImageView:UIImageView = {
             let img = UIImageView()
             img.contentMode = .scaleAspectFill 
             img.translatesAutoresizingMaskIntoConstraints = false
             img.clipsToBounds = true
            return img
         }()
    
    let authorLabel:UILabel = {
            let label = UILabel()
            label.textColor = .black
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.boldSystemFont(ofSize: 18.0)
            return label
    }()
    
    let descriptionLabel:UILabel = {
            let label = UILabel()
            label.font = UIFont.boldSystemFont(ofSize: 20)
            label.textColor = .black
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(postImageView)
        self.contentView.addSubview(authorLabel)
        self.contentView.addSubview(descriptionLabel)
        
        authorLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 15).isActive = true
        authorLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        authorLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        
        postImageView.heightAnchor.constraint(equalToConstant: 400).isActive = true
        postImageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 15).isActive = true
        postImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10).isActive = true
        postImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10).isActive = true
        
        descriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 15).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
     }

     required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }

}
