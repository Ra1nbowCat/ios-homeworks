//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Илья Лехов on 21.03.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(postImageView)
        self.contentView.addSubview(authorLabel)
        //self.contentView.addSubview(descriptionLabel)
        
        //self.contentView.addSubview(containerView)
        
        authorLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        authorLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        authorLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        
        //postImageView.heightAnchor.constraint(equalToConstant: 400).isActive = true
        //postImageView.widthAnchor.constraint(equalToConstant: 400).isActive = true
        postImageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor).isActive = true
        postImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        postImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
     }

     required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    var post:Post? {
        didSet {
            guard let postItem = post else {return}
            if let author = postItem.author {
                authorLabel.text = " \(author) "
            }
            
            if let name = postItem.image {
                postImageView.image = UIImage(named: name)
            }
        }
    }
    
    let postImageView:UIImageView = {
             let img = UIImageView()
             img.contentMode = .scaleAspectFill // image will never be strecthed vertially or horizontally
             img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
             img.layer.cornerRadius = 35
             img.clipsToBounds = true
            return img
         }()
    
    let authorLabel:UILabel = {
            let label = UILabel()
            label.textColor = .black
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
    }()
    
    let descriptionLabel:UILabel = {
            let label = UILabel()
            label.font = UIFont.boldSystemFont(ofSize: 20)
            label.textColor = .systemGray
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
    }()
    
    let containerView:UIView = {
      let view = UIView()
      view.translatesAutoresizingMaskIntoConstraints = false
      view.clipsToBounds = true
      return view
    }()

}
