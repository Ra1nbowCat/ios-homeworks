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
        imageView  = UIImageView(frame: CGRect(x: 30, y: -50, width: 150, height: 150))
           imageView.image = UIImage(named:"mario_logo")
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        return imageView
    } ()
    
}
