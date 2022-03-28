//
//  PhotoCollectionViewCell.swift
//  Navigation
//
//  Created by Илья Лехов on 28.03.2022.
//

import UIKit

protocol ReusableView: AnyObject {
    static var identifier: String { get }
}

class PhotoCollectionViewCell: UICollectionViewCell {
    
    private enum Constants {
        static let contentViewCornerRadius: CGFloat = 4.0
        static let imageHeight: CGFloat = 180.0
        static let verticalSpacing: CGFloat = 8.0
        static let horizontalPadding: CGFloat = 16.0
        static let profileDescriptionVerticalPadding: CGFloat = 8.0
    }
    
    private let photoImageView: UIImageView = {
           let imageView = UIImageView(frame: .zero)
           imageView.contentMode = .scaleAspectFill
           return imageView
       }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
        setupLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = Constants.contentViewCornerRadius
        contentView.backgroundColor = .white

        contentView.addSubview(photoImageView)
    }
    
    private func setupLayouts() {
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
       

        // Layout constraints for `profileImageView`
        NSLayoutConstraint.activate([
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoImageView.heightAnchor.constraint(equalToConstant: Constants.imageHeight)
        ])
    }
    
    func setup(with photo: Photos) {
        photoImageView.image = UIImage(named: photo.imageName)
    }
}

extension PhotoCollectionViewCell: ReusableView {
    static var identifier: String {
        return String(describing: self)
    }
}
