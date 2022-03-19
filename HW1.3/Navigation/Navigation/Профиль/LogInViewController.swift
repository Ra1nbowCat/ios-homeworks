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
    }
    
    let LogoImageView: UIImageView = {
        var imageView : UIImageView
        imageView  = UIImageView(frame: CGRect(x: 16, y: 16, width: 150, height: 150))
           imageView.image = UIImage(named:"logo")
        // imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    } ()
    
    func addElements() {
        view.addSubview(LogoImageView)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            LogoImageView.heightAnchor.constraint(equalToConstant: 100),
            LogoImageView.widthAnchor.constraint(equalToConstant: 100),
            LogoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            LogoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120)
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
