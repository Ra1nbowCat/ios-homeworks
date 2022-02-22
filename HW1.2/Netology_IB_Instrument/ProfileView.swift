//
//  ProfileView.swift
//  Netology_IB_Instrument
//
//  Created by Илья Лехов on 18.02.2022.
//

import UIKit

class ProfileView: UIView {

    @IBOutlet var mainImage: UIImageView!
    
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var dateLabel: UILabel!
    
    @IBOutlet var cityLabel: UILabel!
    
    @IBOutlet var descriptionText: UITextView!
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            self.setupView()
        }
        
        required init?(coder: NSCoder) {
            super.init(coder: coder)
            self.setupView()
        }
        
        private func setupView() {
            let view = self.loadViewFromXib()
            view.frame = self.bounds
            view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            self.addSubview(view)
        }
        
        private func loadViewFromXib() -> UIView {
            guard let view = Bundle.main.loadNibNamed("ProfileView", owner: nil, options: nil)?.first as? UIView else { return UIView() }
            
            return view
        }
}
