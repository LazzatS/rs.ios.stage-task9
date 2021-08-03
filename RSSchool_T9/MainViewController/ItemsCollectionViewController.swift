//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Lazzat Seiilova
// On: 02.08.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

protocol ItemSelectionDelegate {
    func didChooseStory(with type: String, coverTitle: String, coverImage: UIImage, cgPaths: [CGPath], text: String)
    func didChooseGallery(with type: String, coverTitle: String, coverImage: UIImage, images: [UIImage])
}

class ItemsCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    private var collectionView: UICollectionView?
    var delegate: ItemSelectionDelegate?
    
    static let data = FillingData.data
    
    var coverImages = [UIImage]()
    var titles = [String]()
    var types = [String]()
    
    var cgPaths = [CGPath?]()
    var texts = [String?]()
    var galleryImages = [[UIImage]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
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
        collectionView = UICollectionView(frame: CGRect(x: 20,
                                                        y: 40,
                                                        width: (view.frame.size.width - 2 * 20),
                                                        height: (view.frame.size.height - 40)),
                                          collectionViewLayout: collectionViewLayout())
        
        guard let collectionView = collectionView else { return }
        
        collectionView.register(ItemCollectionViewCell.self, forCellWithReuseIdentifier: ItemCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self

        collectionView.backgroundColor = UIColor(named: "CustomWhiteGray")
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let itemVC = ItemViewController()
        
        if texts[indexPath.row] != nil {
            print("chose \(titles[indexPath.row])")
            delegate?.didChooseStory(with: types[indexPath.row], coverTitle: titles[indexPath.row], coverImage: coverImages[indexPath.row], cgPaths: cgPaths[indexPath.row] as! [CGPath], text: texts[indexPath.row]!)
            
//            itemVC.cgPaths = cgPaths[indexPath.row]
            itemVC.text = texts[indexPath.row]
        }
        
        if texts[indexPath.row] == nil  {
            delegate?.didChooseGallery(with: types[indexPath.row], coverTitle: titles[indexPath.row], coverImage: coverImages[indexPath.row], images: galleryImages[indexPath.row])
            itemVC.galleryImages = galleryImages[indexPath.row]
        }
        itemVC.coverImage = coverImages[indexPath.row]
        itemVC.coverTitle = titles[indexPath.row]
        itemVC.type = types[indexPath.row]
        navigationController?.pushViewController(itemVC, animated: true)
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
                    cgPaths.append(contentsOf: story.paths)
                    texts.append(story.text)
                    galleryImages.append([])
                }
            case .gallery(let gallery):
                if titles.count < data.count {
                    coverImages.append(gallery.coverImage)
                    titles.append(gallery.title)
                    types.append(gallery.type)
                    galleryImages.append(gallery.images)
                    cgPaths.append(nil)
                    texts.append(nil)
                }
            }
        }
    }
    
}
