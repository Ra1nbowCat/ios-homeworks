//
//  LogInViewController.swift
//  Navigation
//
//  Created by Илья Лехов on 19.03.2022.
//

import UIKit

class LogInViewController: UIViewController {
    
    var newColor = UIColor(rgb: 0x4885CC)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addElements()
        addConstraints()
        
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 50))
        let flexibleSpase = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done , target: self, action: #selector(didTapDone))
        toolBar.items = [flexibleSpase, doneButton]
        toolBar.sizeToFit()
        FirstLogoTextField.inputAccessoryView = toolBar
        SecondLogoTextField.inputAccessoryView = toolBar
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        FirstLogoTextField.resignFirstResponder()
        SecondLogoTextField.resignFirstResponder()
    }
    
    @objc func keyboardWillShow(notification:NSNotification) {
        guard let keyboardFrameValue = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        scrollView.contentOffset = CGPoint(x:0, y:keyboardFrameValue.height * 0.5)
        scrollView.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardFrameValue.height, right: 0)
    }

    @objc func keyboardWillHide(notification:NSNotification) {
        scrollView.contentOffset = CGPoint.zero
    }
    
    let LogoImageView: UIImageView = {
        var imageView : UIImageView
        imageView  = UIImageView(frame: CGRect(x: 16, y: 16, width: 150, height: 150))
        imageView.image = UIImage(named:"logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    } ()
    
    let FirstLogoTextField: UITextField = {
        var textField = UITextField()
        textField.placeholder = "Email or phone"
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.textColor = .black
        textField.backgroundColor = .systemGray6
        textField.autocapitalizationType = .none
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10
        textField.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderColor = UIColor.lightGray.cgColor
        return textField
    } ()
    
    let SecondLogoTextField: UITextField = {
        var textField = UITextField()
        textField.placeholder = "Password"
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.textColor = .black
        textField.backgroundColor = .systemGray6
        textField.autocapitalizationType = .none
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10
        textField.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.isSecureTextEntry = true
        return textField
    } ()
    
    let TextFieldsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    } ()
    
    let LogInButton: UIButton = {
        var button = UIButton(type: .system)
        button.layer.cornerRadius = 10
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "blue_pixel")
        button.setBackgroundImage(image, for: UIControl.State.normal)
        if button.isSelected || button.isHighlighted {
            button.alpha = 0.8
        }
        button.addTarget(self, action: #selector(transitionScreen), for: .touchUpInside)
        return button
    } ()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.frame.size = contentViewSize
        return view
    } ()
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.backgroundColor = .white
        view.contentSize = contentViewSize
        view.frame = self.view.bounds
        return view
    } ()
    
    lazy var contentViewSize = CGSize(width: self.view.frame.width, height: self.view.frame.height)
    
    
    func addElements() {
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        
        containerView.addSubview(LogoImageView)
        TextFieldsStackView.addArrangedSubview(FirstLogoTextField)
        TextFieldsStackView.addArrangedSubview(SecondLogoTextField)
        containerView.addSubview(TextFieldsStackView)
        view.addSubview(LogInButton)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            LogoImageView.heightAnchor.constraint(equalToConstant: 100),
            LogoImageView.widthAnchor.constraint(equalToConstant: 100),
            LogoImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            LogoImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 120)
            ])
        
        NSLayoutConstraint.activate([
            TextFieldsStackView.heightAnchor.constraint(equalToConstant: 100),
            TextFieldsStackView.topAnchor.constraint(equalTo: LogoImageView.bottomAnchor, constant: 120),
            TextFieldsStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            TextFieldsStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16)
            ])
        
        NSLayoutConstraint.activate([
            LogInButton.heightAnchor.constraint(equalToConstant: 50),
            LogInButton.topAnchor.constraint(equalTo: TextFieldsStackView.bottomAnchor, constant: 16),
            LogInButton.trailingAnchor.constraint(equalTo: TextFieldsStackView.trailingAnchor),
            LogInButton.leadingAnchor.constraint(equalTo: TextFieldsStackView.leadingAnchor)
            ])
    }
    
    @objc func didTapDone() {
        FirstLogoTextField.resignFirstResponder()
        SecondLogoTextField.resignFirstResponder()
    }
    
    @objc private func transitionScreen(button: UINavigationItem) {
         let vc = ProfileViewController()
         self.navigationController?.pushViewController(vc, animated: true)
     }
}


extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}
