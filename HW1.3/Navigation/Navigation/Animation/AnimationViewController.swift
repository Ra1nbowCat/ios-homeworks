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
        newView.isUserInteractionEnabled = true
        newButton.isUserInteractionEnabled = true
        
        self.setupViews()
        self.addConstraintsToView()
        self.setupGesture()
    }
    
    private let newView: UIView = {
        var newview: UIView
        newview = UIView()
        newview.backgroundColor = .systemRed
        newview.translatesAutoresizingMaskIntoConstraints = false
        newview.isHidden = true
        return newview
    } ()
    
    private let newButton: UIButton = {
        var button = UIButton()
        button.alpha = 0
        button.backgroundColor = .white
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(systemName: "power.circle")
        button.setBackgroundImage(image, for: UIControl.State.normal)
        button.addTarget(self, action: #selector(handleTapGestureTwo(_:)), for: .touchUpInside)
        return button
    } ()
    
    private let marioImageView: UIImageView = {
        var imageView : UIImageView
        imageView  = UIImageView(frame: CGRect(x: 16, y: 16, width: 150, height: 150))
           imageView.image = UIImage(named:"fifteenth_meme")
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    } ()
    
    private var widthConstraintView: NSLayoutConstraint?
    private var heigthConstraintView: NSLayoutConstraint?
    private var leftConstraintView: NSLayoutConstraint?
    private var topConstraintView: NSLayoutConstraint?
    
    private var widthConstraint: NSLayoutConstraint?
    private var heigthConstraint: NSLayoutConstraint?
    private var leftConstraint: NSLayoutConstraint?
    private var topConstraint: NSLayoutConstraint?
    
    private var widthConstraintButton: NSLayoutConstraint?
    private var heigthConstraintButton: NSLayoutConstraint?
    private var leftConstraintButton: NSLayoutConstraint?
    private var topConstraintButton: NSLayoutConstraint?
    
    private let tapGestureRecognizer = UITapGestureRecognizer()
    
    private let secondTapGestureRecognizer = UITapGestureRecognizer()
    
    private var isExpanded = false
    
    private func addConstraintsToView() {
    
            widthConstraint = marioImageView.widthAnchor.constraint(equalToConstant: 150)
            heigthConstraint = marioImageView.heightAnchor.constraint(equalToConstant: 150)
            leftConstraint = marioImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        topConstraint = marioImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16)
        
            widthConstraintView = newView.widthAnchor.constraint(equalToConstant: 50)
            heigthConstraintView = newView.heightAnchor.constraint(equalToConstant: 50)
            leftConstraintView = newView.leadingAnchor.constraint(equalTo: marioImageView.leadingAnchor, constant: 0)
            topConstraintView = newView.topAnchor.constraint(equalTo: marioImageView.bottomAnchor, constant: 16)
        
            widthConstraintButton = newButton.widthAnchor.constraint(equalToConstant: 20)
            heigthConstraintButton = newButton.heightAnchor.constraint(equalToConstant: 20)
            leftConstraintButton = newButton.leadingAnchor.constraint(equalTo: marioImageView.trailingAnchor, constant: 0)
            topConstraintButton = newButton.topAnchor.constraint(equalTo: marioImageView.topAnchor, constant: 0)
        
        NSLayoutConstraint.activate([
            widthConstraint!, heigthConstraint!, leftConstraint!, topConstraint!,
            widthConstraintView!, heigthConstraintView!, leftConstraintView!,topConstraintView!,
            widthConstraintButton!,heigthConstraintButton!, leftConstraintButton!,topConstraintButton!,
        ])
    }
    
    private func setupViews() {
        self.view.addSubview(self.marioImageView)
        self.view.addSubview(self.newView)
        self.view.addSubview(self.newButton)
    }
    
    private func setupGesture() {
        self.tapGestureRecognizer.addTarget(self, action: #selector(handleTapGesture(_:)))
        self.secondTapGestureRecognizer.addTarget(self, action: #selector(handleTapGestureTwo(_:)))
        self.marioImageView.addGestureRecognizer(self.tapGestureRecognizer)
        self.newButton.addGestureRecognizer(self.secondTapGestureRecognizer)
    }
    
    @objc private func handleTapGesture(_ gestureRecognizer: UITapGestureRecognizer) {
        guard self.tapGestureRecognizer === gestureRecognizer else {return}
        
        self.isExpanded.toggle()
        
        if isExpanded == true {
        
        self.newView.isHidden = false
        self.newView.alpha = 0.2
        
        self.widthConstraint?.constant = self.isExpanded ? self.view.frame.width - 32 : 150
        self.heigthConstraint?.constant = self.isExpanded ? self.view.frame.width - 32 : 150
        self.topConstraint?.constant = self.isExpanded ? self.view.frame.height / 2.5 - heigthConstraint!.constant / 2 : 16
        
            self.heigthConstraintView?.constant = self.isExpanded ? heigthConstraint!.constant / 10 : 0
        self.widthConstraintView?.constant = self.isExpanded ? widthConstraint!.constant : 0
        
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded() }
        completion: { _
            in
        }
        
        UIView.animate(withDuration: 0.3, delay: 0.5) {
            self.newButton.alpha = self.isExpanded ? 1 : 0 }
        }
    }
    
    @objc private func handleTapGestureTwo(_ gestureRecognizer: UITapGestureRecognizer) {
        guard self.secondTapGestureRecognizer === gestureRecognizer else {return}
        
        self.isExpanded.toggle()
        
        self.newView.isHidden = false
        self.newView.alpha = 0.2
        
        self.widthConstraint?.constant = self.isExpanded ? self.view.frame.width - 32 : 150
        self.heigthConstraint?.constant = self.isExpanded ? self.view.frame.width - 32 : 150
        self.topConstraint?.constant = self.isExpanded ? self.view.frame.height / 2.5 - heigthConstraint!.constant / 2 : 16
        
        self.heigthConstraintView?.constant = self.isExpanded ? heigthConstraint!.constant / 10 : 0
        self.widthConstraintView?.constant = self.isExpanded ? widthConstraint!.constant : 0
        
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded() }
        completion: { _
            in
        }
        
        UIView.animate(withDuration: 0.5) {
            self.newButton.alpha = self.isExpanded ? 1 : 0 }
    }
}
