//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Lazzat Seiilova
// On: 02.08.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class ItemsCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    private var collectionView: UICollectionView?
    
    
    static let data = FillingData.data
    
    var coverImages = [UIImage]()
    var titles = [String]()
    var types = [String]()
    
    private let coverImage: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createCollectionView()
        setCoverItemInfo()
    }
    
    func createCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        layout.itemSize = CGSize(width: (view.frame.size.width / 2 - 2), height: (view.frame.size.width / 2 - 2))
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        guard let collectionView = collectionView else { return }
        
        collectionView.register(ItemCollectionViewCell.self, forCellWithReuseIdentifier: ItemCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.frame = view.bounds
        view.addSubview(collectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionViewCell.identifier, for: indexPath)
        
        let coverImage = UIImageView()
        coverImage.frame = cell.contentView.bounds
        coverImage.contentMode = .scaleToFill
        coverImage.clipsToBounds = true
        coverImage.image = coverImages[indexPath.row]
        cell.contentView.addSubview(coverImage)
        
        let coverTitle = UILabel()
        coverTitle.frame = CGRect(x: 10,
                                  y: cell.contentView.frame.size.height - 50,
                                  width: cell.contentView.frame.size.height - 50,
                                  height: 50)
        coverTitle.textColor = .white
        coverTitle.text = titles[indexPath.row]
        cell.contentView.addSubview(coverTitle)
        
        let coverType = UILabel()
        coverType.frame = CGRect(x: 10,
                                 y: cell.contentView.frame.size.height - 70,
                                 width: cell.contentView.frame.size.height - 50,
                                 height: 50)
        coverType.textColor = .white
        coverType.text = types[indexPath.row]
        cell.contentView.addSubview(coverType)

        return cell
    }
    
    
    func setCoverItemInfo() {
        let data = FillingData.data
        for item in data {
            switch item {
            case .story(let story):
                if titles.count < data.count {
                    coverImages.append(story.coverImage)
                    titles.append(story.title)
                    types.append(story.type)
                }
            case .gallery(let gallery):
                if titles.count < data.count {
                    coverImages.append(gallery.coverImage)
                    titles.append(gallery.title)
                    types.append(gallery.type)
                }
            }
        }
    }
    
}
