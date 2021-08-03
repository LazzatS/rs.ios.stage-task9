//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Lazzat Seiilova
// On: 01.08.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class ItemViewController: UIViewController, UIGestureRecognizerDelegate {

    var coverImage = UIImage()
    var coverTitle: String!
    var type: String!
    
    var cgPaths = [CGPath?]()
    var text: String!
    
    var galleryImages = [UIImage?]()
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    let topImage: UIImageView = {
        let topImage = UIImageView()
        topImage.contentMode = .scaleAspectFill
        topImage.layer.cornerRadius = 8
        topImage.layer.borderWidth = 1
        topImage.layer.borderColor = UIColor.white.cgColor
        topImage.clipsToBounds = true
        topImage.translatesAutoresizingMaskIntoConstraints = false
        return topImage
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        
        setupScrollView()
        setupTopImageLayout()
    }
    
    func setupScrollView(){
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }
    
    func setupTopImageLayout() {
        topImage.image = coverImage
        
        contentView.addSubview(topImage)
        
        topImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        topImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 100).isActive = true
        topImage.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.748).isActive = true
    }
    
}
