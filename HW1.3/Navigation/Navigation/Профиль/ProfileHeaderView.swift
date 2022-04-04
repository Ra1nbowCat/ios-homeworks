//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Илья Лехов on 07.03.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private var statusText: String = ""
    
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
    
    let showStatusButton: UIButton = {
        var button = UIButton(type: .system)
        button.layer.cornerRadius = 4
        button.setTitle("Задать статус", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 4.0
        button.layer.masksToBounds = false
        button.layer.cornerRadius = 4.0
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    } ()
    
    let statusTextField: UITextField = {
        var textField = UITextField()
        textField.placeholder = "Enter text here"
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textField.addTarget(self, action: #selector(statusTextChanged(_:)), for: .editingChanged)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    } ()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        addConstraintsToView()
        
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: 50))
        let flexibleSpase = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done , target: self, action: #selector(didTapDone))
        toolBar.items = [flexibleSpase, doneButton]
        toolBar.sizeToFit()
        statusTextField.inputAccessoryView = toolBar
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Cannot find coder")
    }
    
    func setupViews() {
        self.addSubview(newImageView)
        self.addSubview(mainLabel)
        self.addSubview(statusLabel)
        self.addSubview(showStatusButton)
        self.addSubview(statusTextField)
    }
    
    func addConstraintsToView() {
        NSLayoutConstraint.activate([
            newImageView.widthAnchor.constraint(equalToConstant: 150),
            newImageView.heightAnchor.constraint(equalToConstant: 150),
            newImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            newImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16)
            ])
        
        NSLayoutConstraint.activate([
            mainLabel.widthAnchor.constraint(equalToConstant: 150),
            mainLabel.heightAnchor.constraint(equalToConstant: 18),
            mainLabel.topAnchor.constraint(equalTo: topAnchor, constant: 27),
            mainLabel.leadingAnchor.constraint(equalTo: newImageView.trailingAnchor, constant: 20)
            ])
        
        NSLayoutConstraint.activate([
            statusLabel.widthAnchor.constraint(equalToConstant: 150),
            statusLabel.heightAnchor.constraint(equalToConstant: 18),
            statusLabel.bottomAnchor.constraint(equalTo: newImageView.bottomAnchor, constant: -68),
            statusLabel.leadingAnchor.constraint(equalTo: newImageView.trailingAnchor, constant: 20)
            ])
        
        NSLayoutConstraint.activate([
            showStatusButton.heightAnchor.constraint(equalToConstant: 50),
            showStatusButton.topAnchor.constraint(equalTo: newImageView.bottomAnchor, constant: 16),
            showStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            showStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            ])
        
        NSLayoutConstraint.activate([
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            statusTextField.leadingAnchor.constraint(equalTo: newImageView.trailingAnchor, constant: 20),
            statusTextField.bottomAnchor.constraint(equalTo: showStatusButton.topAnchor, constant: -20),
            statusTextField.trailingAnchor.constraint(equalTo: showStatusButton.trailingAnchor, constant: 0)
            ])
    }
    
    @objc func didTapDone() {
        statusTextField.resignFirstResponder()
    }
    
    @IBAction func buttonPressed(sender: UIButton){
        if statusTextField.text == ""  {
            statusLabel.textColor = .red
            statusLabel.text = "Error: empty status"
        } else {
            statusLabel.textColor = .darkGray
            statusLabel.text = statusText
        }
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = statusTextField.text!
    }
}
