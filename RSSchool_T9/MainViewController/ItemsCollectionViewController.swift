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
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if let layoutRotated = self.collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            createLayout(for: layoutRotated, with: size)
        }
    }
    
    func createCollectionView() {
        collectionView = UICollectionView(frame: CGRect(x: 20, y: 40, width: (view.frame.size.width - 2 * 20), height: (view.frame.size.height - 40)), collectionViewLayout: collectionViewLayout())
        
        guard let collectionView = collectionView else { return }
        
        collectionView.register(ItemCollectionViewCell.self, forCellWithReuseIdentifier: ItemCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionViewCell.identifier, for: indexPath) as! ItemCollectionViewCell
        cell.configure(with: coverImages[indexPath.row], coverTitle: titles[indexPath.row], coverType: types[indexPath.row])
        return cell
    }
    
    func collectionViewLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        createLayout(for: layout, with: view.frame.size)
        return layout
    }
    
    func createLayout(for layout: UICollectionViewFlowLayout, with size: CGSize) {
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 30
        layout.minimumInteritemSpacing = 16
        
        let cellAspectRactio = CGFloat(0.815)
        let itemWidth = size.width / 2 - layout.minimumInteritemSpacing - 20
        let itemHeight = itemWidth / cellAspectRactio
        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        
        collectionView?.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView?.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        
        collectionView?.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        collectionView?.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        collectionView?.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        collectionView?.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
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
