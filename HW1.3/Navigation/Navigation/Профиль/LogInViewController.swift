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
        view.backgroundColor = .white
        addElements()
        addConstraints()
        
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 50))
        let flexibleSpase = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done , target: self, action: #selector(didTapDone))
        toolBar.items = [flexibleSpase, doneButton]
        toolBar.sizeToFit()
        FirstLogoTextField.inputAccessoryView = toolBar
        SecondLogoTextField.inputAccessoryView = toolBar
    }
    
    @objc func didTapDone() {
        FirstLogoTextField.resignFirstResponder()
        SecondLogoTextField.resignFirstResponder()
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
        return button
    } ()
    
    
    func addElements() {
        view.addSubview(LogoImageView)
        TextFieldsStackView.addArrangedSubview(FirstLogoTextField)
        TextFieldsStackView.addArrangedSubview(SecondLogoTextField)
        view.addSubview(TextFieldsStackView)
        view.addSubview(LogInButton)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            LogoImageView.heightAnchor.constraint(equalToConstant: 100),
            LogoImageView.widthAnchor.constraint(equalToConstant: 100),
            LogoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            LogoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120)
            ])
        
        NSLayoutConstraint.activate([
            TextFieldsStackView.heightAnchor.constraint(equalToConstant: 100),
            TextFieldsStackView.topAnchor.constraint(equalTo: LogoImageView.bottomAnchor, constant: 120),
            TextFieldsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            TextFieldsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
            ])
        
        NSLayoutConstraint.activate([
            LogInButton.heightAnchor.constraint(equalToConstant: 50),
            LogInButton.topAnchor.constraint(equalTo: TextFieldsStackView.bottomAnchor, constant: 16),
            LogInButton.trailingAnchor.constraint(equalTo: TextFieldsStackView.trailingAnchor),
            LogInButton.leadingAnchor.constraint(equalTo: TextFieldsStackView.leadingAnchor)
            ])
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

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
