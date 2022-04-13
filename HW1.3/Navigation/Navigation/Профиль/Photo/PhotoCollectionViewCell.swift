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

final class PhotoCell: UICollectionViewCell {
    
    private var rightConstraintView: NSLayoutConstraint?
    private var heigthConstraintView: NSLayoutConstraint?
    private var leftConstraintView: NSLayoutConstraint?
    private var topConstraintView: NSLayoutConstraint?

    private enum Constants {
        static let imageHeight: CGFloat = 150.0
    }
    
    private let photoImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        return imageView
    }()


    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
        setupLayouts()
    }

    private func setupViews() {
        contentView.clipsToBounds = true
        contentView.backgroundColor = .white

        contentView.addSubview(photoImageView)
    }

    private func setupLayouts() {
        
        rightConstraintView = photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        heigthConstraintView = photoImageView.heightAnchor.constraint(equalToConstant: Constants.imageHeight)
        leftConstraintView = photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        topConstraintView = photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor)
        
        NSLayoutConstraint.activate([
           rightConstraintView!, leftConstraintView!, topConstraintView!, heigthConstraintView!
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(with photo: Photos) {
        photoImageView.image = UIImage(named: photo.imageName)
    }
}


extension PhotoCell: ReusableView {
    static var identifier: String {
        return String(describing: self)
    }
}
