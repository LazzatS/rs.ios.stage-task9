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
        scrollView.backgroundColor = .black
        contentView.backgroundColor = .black
        setupScrollView()
        createCloseButton()
        setupTopImageLayout()
        addTitleOnTopImage()
        addTypeOnTopImage()
        if text == nil {
            showGalleryCollection()
        }
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
    
    func createCloseButton() {
        let closeButton = UIButton()
        closeButton.frame = CGRect(x: 350, y: 30, width: 40, height: 40)
        closeButton.setImage(UIImage.init(systemName: "xmark"), for: .normal)
        closeButton.titleLabel?.font = UIFont(name: "SF Pro Display", size: 18)
        closeButton.setTitleColor(.white, for: .normal)
        closeButton.tintColor = .white
        closeButton.layer.cornerRadius = closeButton.frame.size.width / 2
        closeButton.layer.borderColor = UIColor.white.cgColor
        closeButton.layer.borderWidth = 1
        
        contentView.addSubview(closeButton)
        closeButton.addTarget(self, action: #selector(closeView), for: .touchUpInside)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        closeButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30).isActive = true
        closeButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -25).isActive = true
    }
    
    func setupTopImageLayout() {
        
        let imageWidth = view.frame.size.width - 20 * 2
        let imageHeight = imageWidth / 0.748
        
        topImage.image = coverImage
        contentView.addSubview(topImage)
        
        topImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        topImage.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        topImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 100).isActive = true
        topImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: (-CGFloat(galleryImages.count) * (imageHeight + 40))).isActive = true
        topImage.widthAnchor.constraint(equalToConstant: imageWidth).isActive = true
        topImage.heightAnchor.constraint(equalToConstant: imageHeight).isActive = true
    }
    
    func addTitleOnTopImage() {
        let title = UILabel()
        title.text = coverTitle
        title.numberOfLines = 0
        title.font = UIFont(name: "Rockwell", size: 48)
        title.textColor = .white
        contentView.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.leftAnchor.constraint(equalTo: topImage.leftAnchor, constant: 30).isActive = true
        title.rightAnchor.constraint(equalTo: topImage.rightAnchor, constant: -30).isActive = true
        title.bottomAnchor.constraint(equalTo: topImage.bottomAnchor, constant: -55).isActive = true
    }
    
    func addTypeOnTopImage() {
        let type = UIButton()
        type.isEnabled = false
        if text != nil {
            type.setTitle("Story", for: .normal)
            type.frame = CGRect(x: 0, y: 0, width: 122, height: 40)
        } else {
            type.setTitle("Gallery", for: .normal)
            type.frame = CGRect(x: 0, y: 0, width: 152, height: 40)
        }
        type.layer.backgroundColor = UIColor.black.cgColor
        type.layer.borderColor = UIColor.white.cgColor
        type.layer.cornerRadius = 8
        type.layer.borderWidth = 1
        type.titleLabel?.font = UIFont(name: "Rockwell", size: 24)
        type.titleLabel?.textAlignment = .center
        type.tintColor = .white
        contentView.addSubview(type)
        
        type.translatesAutoresizingMaskIntoConstraints = false
        type.centerYAnchor.constraint(equalTo: topImage.bottomAnchor, constant: 0).isActive = true
        type.centerXAnchor.constraint(equalTo: topImage.centerXAnchor, constant: 0).isActive = true
        type.widthAnchor.constraint(equalTo: topImage.widthAnchor, multiplier: 1/3).isActive = true
    }
    
    func showGalleryCollection() {
        let galleryCollection = GalleryCollection(frame: CGRect(x: 0,
                                                                y: (topImage.frame.size.height + 150),
                                                                width: (view.frame.size.width - 2 * 20),
                                                                height: view.frame.size.height))
        galleryCollection.galleryImages = galleryImages
        contentView.addSubview(galleryCollection)
        galleryCollection.translatesAutoresizingMaskIntoConstraints = false
        galleryCollection.topAnchor.constraint(equalTo: topImage.bottomAnchor, constant: 108).isActive = true
        galleryCollection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
        galleryCollection.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        galleryCollection.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
    }
    
    @objc func closeView() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
