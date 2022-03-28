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
            
            if let likes = postItem.likes {
                likesLabel.text = " Likes: \(likes) "
            }
            
            if let views = postItem.views {
                viewsLabel.text = " Views: \(views)"
            }
        }
    }
    
    let postImageView:UIImageView = {
             let img = UIImageView()
             img.contentMode = .scaleAspectFill 
             img.translatesAutoresizingMaskIntoConstraints = false
             img.clipsToBounds = true
             img.contentMode = .scaleAspectFit
             img.backgroundColor = .white
            // Понимаю, что здесь нужно черный фон, но сделал это ради собственного плохого понимания дизайна :)
            return img
         }()
    
    let authorLabel:UILabel = {
            let label = UILabel()
            label.textColor = .black
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            label.numberOfLines = 2
            return label
    }()
    
    let likesLabel:UILabel = {
            let label = UILabel()
            label.textColor = .black
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
            return label
    }()
    
    let viewsLabel:UILabel = {
            let label = UILabel()
            label.textColor = .black
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
            return label
    }()
    
    let descriptionLabel:UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            label.textColor = .systemGray
            label.numberOfLines = 0
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(postImageView)
        self.contentView.addSubview(authorLabel)
        self.contentView.addSubview(descriptionLabel)
        self.contentView.addSubview(likesLabel)
        self.contentView.addSubview(viewsLabel)
        
        authorLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 15).isActive = true
        authorLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16).isActive = true
        authorLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 16).isActive = true
        
        postImageView.heightAnchor.constraint(equalToConstant: 400).isActive = true
        postImageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 16).isActive = true
        postImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10).isActive = true
        postImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10).isActive = true
        
        descriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 15).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 16).isActive = true
        
        likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 15).isActive = true
        likesLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16).isActive = true
        
        viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 15).isActive = true
        viewsLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16).isActive = true
     }

     required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }

}
