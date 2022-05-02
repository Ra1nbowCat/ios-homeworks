//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Илья Лехов on 27.03.2022.
//

import UIKit

class PhotosViewController: UIViewController {

    private var photos: [Photos] = []
    
    private let collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.backgroundColor = .white
        return collectionView
    }()

   private enum LayoutConstant {
        static let spacing: CGFloat = 8.0
        static let itemHeight: CGFloat = 150.0
    }
    
    private let newView:UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.isUserInteractionEnabled = true
        return view
    } ()
    
    private let tapGestureRecognizer = UITapGestureRecognizer()
    
    private func setupGesture() {
        self.tapGestureRecognizer.addTarget(self, action: #selector(handleTapGesture(_:)))
        self.newView.addGestureRecognizer(self.tapGestureRecognizer)
    }
    
    @objc private func handleTapGesture(_ gestureRecognizer: UITapGestureRecognizer) {
        guard self.tapGestureRecognizer === gestureRecognizer else {return}
        newView.subviews.forEach({ $0.removeFromSuperview() })
        self.newView.removeFromSuperview()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Photo gallery"
        
        let newButton = UIBarButtonItem(title: "Hide", style: .plain, target: self, action: #selector(transitionScreenPop))
        navigationItem.leftBarButtonItem = newButton
        
        setupViews()
        setupLayouts()
        populatePhotos()
        setupGesture()
        collectionView.reloadData()
    }
    
    @objc private func transitionScreenPop() {
        self.navigationController?.dismiss(animated: true)
     }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(collectionView)

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.identifier)
    }

    private func setupLayouts() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        // Layout constraints for `collectionView`
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }

    private func populatePhotos() {
        photos = [
            Photos(imageName: "first_meme"),
            Photos(imageName: "second_meme"),
            Photos(imageName: "third_meme"),
            Photos(imageName: "fourth_meme"),
            Photos(imageName: "fifth_meme"),
            Photos(imageName: "sixth_meme"),
            Photos(imageName: "seventh_meme"),
            Photos(imageName: "eighth_meme"),
            Photos(imageName: "ninth_meme"),
            Photos(imageName: "tenth_meme"),
            Photos(imageName: "eleventh_meme"),
            Photos(imageName: "twelth_meme"),
            Photos(imageName: "thirteenth_meme"),
            Photos(imageName: "fourteenth_meme"),
            Photos(imageName: "fifteenth_meme"),
            Photos(imageName: "sixteenth_meme"),
            Photos(imageName: "seventeenth_meme"),
            Photos(imageName: "eighteenth_meme"),
            Photos(imageName: "nineteenth_meme"),
            Photos(imageName: "twentieth_meme")
        ]
    }

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.identifier, for: indexPath) as! PhotoCell
        
        cell.delegatePhoto = self
        let photo = photos[indexPath.row]
        cell.setup(with: photo)
        return cell
    }
}



extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = itemWidth(for: view.frame.width, spacing: LayoutConstant.spacing)

        return CGSize(width: width, height: LayoutConstant.itemHeight)
    }
    

    func itemWidth(for width: CGFloat, spacing: CGFloat) -> CGFloat {
        let itemsInRow:CGFloat = 3
        
        let totalSpacing: CGFloat = 2 * spacing + (itemsInRow - 1) * spacing
        let finalWidth = (width - totalSpacing) / itemsInRow

        return floor(finalWidth)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: LayoutConstant.spacing, left: LayoutConstant.spacing, bottom: LayoutConstant.spacing, right: LayoutConstant.spacing)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return LayoutConstant.spacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return LayoutConstant.spacing
    }
}

extension PhotosViewController: photoDelegate {
    func screenTransition(add: UIImageView) {
        view.addSubview(newView)
        newView.addSubview(add)
        add.clipsToBounds = true
        
        newView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        newView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        newView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        newView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        add.centerXAnchor.constraint(equalTo: newView.centerXAnchor).isActive = true
        add.centerYAnchor.constraint(equalTo: newView.centerYAnchor).isActive = true
    }
}