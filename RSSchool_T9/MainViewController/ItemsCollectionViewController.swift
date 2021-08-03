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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createCollectionView()
        setCoverItemInfo()
    }
    
    func createCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
        
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionViewCell.identifier, for: indexPath) as! ItemCollectionViewCell
        cell.configure(with: coverImages[indexPath.row], coverTitle: titles[indexPath.row], coverType: types[indexPath.row])
        return cell
    }
    
    func collectionViewLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        layout.itemSize = CGSize(width: (view.frame.size.width / 2 - 2), height: (view.frame.size.width / 2 - 2))
        return layout
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
