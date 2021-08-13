//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Lazzat Seiilova
// On: 09.08.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

protocol GalleryCollectionDelegate: AnyObject {
    func didSelectImage(image: UIImage)
}

class GalleryCollection: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var galleryImages = [UIImage?]()
    private var galleryCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    weak var delegate: GalleryCollectionDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        galleryCollectionView.frame = self.bounds
    }
    
    func createCollectionView() {
        galleryCollectionView = UICollectionView(frame: .zero,
                                                 collectionViewLayout: createGalleryLayout())
        galleryCollectionView.register(GalleryCollectionViewCell.self, forCellWithReuseIdentifier: GalleryCollectionViewCell.identifier)
        galleryCollectionView.delegate = self
        galleryCollectionView.dataSource = self
        self.addSubview(galleryCollectionView)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return galleryImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = galleryCollectionView.dequeueReusableCell(withReuseIdentifier: GalleryCollectionViewCell.identifier, for: indexPath) as! GalleryCollectionViewCell
        cell.configure(with: galleryImages[indexPath.row]!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectImage(image: galleryImages[indexPath.row]!)
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let imageWidth = self.frame.size.width
        let imageHeight = imageWidth / 0.721
        return CGSize(width: imageWidth, height: imageHeight)
    }
    
    func createGalleryLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 20
        layout.scrollDirection = .vertical
        return layout
    }
    
}
