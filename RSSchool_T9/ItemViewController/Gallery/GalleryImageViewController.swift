//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Lazzat Seiilova
// On: 13.08.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class GalleryImageViewController: UIViewController {

    let galleryImageScrollView = UIScrollView()
    let galleryImageContentView = UIView()
    var imageNeeded = UIImage()
    
    var imageToShow: UIImageView = {
        let imageToShow = UIImageView()
        imageToShow.contentMode = .scaleAspectFit
        imageToShow.clipsToBounds = true
        
        return imageToShow
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupScrollView()
        showImage()
    }
    
    func setupScrollView(){
        galleryImageScrollView.translatesAutoresizingMaskIntoConstraints = false
        galleryImageContentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(galleryImageScrollView)
        galleryImageScrollView.addSubview(galleryImageContentView)
        
        galleryImageScrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        galleryImageScrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        galleryImageScrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        galleryImageScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        galleryImageContentView.centerXAnchor.constraint(equalTo: galleryImageScrollView.centerXAnchor).isActive = true
        galleryImageContentView.widthAnchor.constraint(equalTo: galleryImageScrollView.widthAnchor).isActive = true
        galleryImageContentView.topAnchor.constraint(equalTo: galleryImageScrollView.topAnchor).isActive = true
        galleryImageContentView.bottomAnchor.constraint(equalTo: galleryImageScrollView.bottomAnchor).isActive = true
    }
    

    
    func showImage() {
        imageToShow.image = imageNeeded

        let imageWidth = view.frame.size.width
        let imageHeight = view.frame.size.height
        let scaleAspect = imageHeight / imageWidth
        
        galleryImageContentView.addSubview(imageToShow)
        
        imageToShow.translatesAutoresizingMaskIntoConstraints = false
        imageToShow.leadingAnchor.constraint(equalTo: galleryImageContentView.leadingAnchor).isActive = true
        imageToShow.trailingAnchor.constraint(equalTo: galleryImageContentView.trailingAnchor).isActive = true
        imageToShow.topAnchor.constraint(equalTo: galleryImageContentView.topAnchor).isActive = true
        imageToShow.bottomAnchor.constraint(equalTo: galleryImageContentView.bottomAnchor).isActive = true
        imageToShow.widthAnchor.constraint(equalToConstant: imageWidth).isActive = true
        imageToShow.heightAnchor.constraint(equalTo: imageToShow.widthAnchor, multiplier: scaleAspect).isActive = true
        imageToShow.centerXAnchor.constraint(equalTo: galleryImageContentView.centerXAnchor).isActive = true
        imageToShow.centerYAnchor.constraint(equalTo: galleryImageContentView.centerYAnchor).isActive = true
    }
    
}
