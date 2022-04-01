//
//  AnimationViewController.swift
//  Navigation
//
//  Created by Илья Лехов on 01.04.2022.
//

import UIKit

class AnimationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        marioImageView.isUserInteractionEnabled = true
        self.setupViews()
        self.addConstraintsToView()
        self.setupGesture()
    }
    
    let marioImageView: UIImageView = {
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
    
    func addConstraintsToView() {
            widthConstraint = marioImageView.widthAnchor.constraint(equalToConstant: 150)
            heigthConstraint = marioImageView.heightAnchor.constraint(equalToConstant: 150)
            leftConstraint = marioImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
            topConstraint = marioImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 16)
        
        NSLayoutConstraint.activate([
            widthConstraint!, heigthConstraint!, leftConstraint!, topConstraint!
        ])
    }
    
    func setupViews() {
        self.view.addSubview(self.marioImageView)
    }
    
    private let tapGestureRecognizer = UITapGestureRecognizer()
    
    private var widthConstraint: NSLayoutConstraint?
    private var heigthConstraint: NSLayoutConstraint?
    private var leftConstraint: NSLayoutConstraint?
    private var topConstraint: NSLayoutConstraint?
    
    private var isExpanded = false
    
    private func setupGesture() {
        self.tapGestureRecognizer.addTarget(self, action: #selector(handleTapGesture(_:)))
        self.marioImageView.addGestureRecognizer(self.tapGestureRecognizer)
    }
    
    
    @objc private func handleTapGesture(_ gestureRecognizer: UITapGestureRecognizer) {
        guard self.tapGestureRecognizer === gestureRecognizer else {return}
        
        self.isExpanded.toggle()
        self.widthConstraint?.constant = self.isExpanded ? self.view.frame.width - 32 : 150
        self.heigthConstraint?.constant = self.isExpanded ? self.view.frame.width - 32 : 150
        self.topConstraint?.constant = self.isExpanded ? self.view.frame.height / 2 - heigthConstraint!.constant / 2 : 16
        
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded() }
        completion: { _
            in
        }
    }
}
