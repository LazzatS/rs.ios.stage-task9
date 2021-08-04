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
        topImage.contentMode = .scaleAspectFit
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
    }
    
    func setupTopImageLayout() {
        
        let imageWidth = view.frame.size.width - 20 * 2
        let imageHeight = imageWidth / 0.748
        
        print("image width = \(imageWidth)")
        print("image height = \(imageHeight)")
        
        
        
        topImage.frame = CGRect(x: 20, y: 100, width: imageWidth, height: imageHeight)
        topImage.image = resizeImage(image: coverImage, targetSize: CGSize(width: imageWidth, height: imageHeight))
        contentView.addSubview(topImage)
        
        print(" but image width = \(topImage.frame.size.width)")
        print(" but image height = \(topImage.frame.size.height)")
        
        topImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        topImage.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        topImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 100).isActive = true
        topImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
        
    }
    
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage? {
        let size = image.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        }
        let rect = CGRect(origin: .zero, size: newSize)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    @objc func closeView() {
        print("tapped")
        self.navigationController?.popViewController(animated: true)
    }
    
}
