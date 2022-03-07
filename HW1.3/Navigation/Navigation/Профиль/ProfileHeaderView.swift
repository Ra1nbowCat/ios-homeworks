//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Илья Лехов on 07.03.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(newImageView)
        NSLayoutConstraint.activate([
            newImageView.widthAnchor.constraint(equalToConstant: 150),
            newImageView.heightAnchor.constraint(equalToConstant: 150),
            newImageView.centerXAnchor.constraint(equalTo: self.leadingAnchor, constant: 91),
            newImageView.centerYAnchor.constraint(equalTo: self.topAnchor, constant: 91)
            ])
        self.addSubview(mainLabel)
        NSLayoutConstraint.activate([
            mainLabel.widthAnchor.constraint(equalToConstant: 150),
            mainLabel.heightAnchor.constraint(equalToConstant: 18),
            mainLabel.centerXAnchor.constraint(equalTo: self.leadingAnchor, constant: 185 + 75),
            mainLabel.centerYAnchor.constraint(equalTo: self.topAnchor, constant: 46)
            ])
        self.addSubview(statusLabel)
        NSLayoutConstraint.activate([
            statusLabel.widthAnchor.constraint(equalToConstant: 150),
            statusLabel.heightAnchor.constraint(equalToConstant: 18),
            statusLabel.centerXAnchor.constraint(equalTo: self.leadingAnchor, constant: 185 + 75),
            statusLabel.centerYAnchor.constraint(equalTo: self.topAnchor, constant: 137)
            ])
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Cannot find coder")
    }
    
    func setupViews() {
        
    }
    
    let contenView: UIView = {
        let view = UIView(frame: CGRect())
        return view
    } ()
    
    let newImageView: UIImageView = {
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
    
    let mainLabel: UILabel = {
        var label: UILabel
        label = UILabel(frame: CGRect(x: 0, y: 0, width: 150, height: 18))
        label.textAlignment = .left
        label.text = "It's-a Me, Mario!"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    let statusLabel: UILabel = {
        var secondLabel: UILabel
        secondLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 150, height: 18))
        secondLabel.textAlignment = .left
        secondLabel.text = "Mario time!"
        secondLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        secondLabel.textColor = .darkGray
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        return secondLabel
    } ()
    
}
