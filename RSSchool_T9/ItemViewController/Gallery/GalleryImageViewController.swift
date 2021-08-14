//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Lazzat Seiilova
// On: 13.08.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class GalleryImageViewController: UIViewController, UIScrollViewDelegate {

    let galleryImageScrollView: UIScrollView = {
        let galleryImageScrollView = UIScrollView()
        galleryImageScrollView.maximumZoomScale = 3
        galleryImageScrollView.minimumZoomScale = 1
        return galleryImageScrollView
    }()
    let galleryImageContentView = UIView()
    var imageNeeded = UIImage()
    
    var imageToShow: UIImageView = {
        let imageToShow = UIImageView()
        imageToShow.contentMode = .scaleAspectFit
        imageToShow.clipsToBounds = true
        imageToShow.translatesAutoresizingMaskIntoConstraints = false
        return imageToShow
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        galleryImageScrollView.backgroundColor = .yellow
        galleryImageContentView.backgroundColor = .cyan
        setupScrollView()
        showImage()
    }
    
    func setupScrollView(){
        galleryImageScrollView.delegate = self
        
        galleryImageScrollView.translatesAutoresizingMaskIntoConstraints = false
        galleryImageContentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(galleryImageScrollView)
        galleryImageScrollView.addSubview(galleryImageContentView)
        
        galleryImageScrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        galleryImageScrollView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        galleryImageScrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        galleryImageScrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        galleryImageScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        galleryImageContentView.centerXAnchor.constraint(equalTo: galleryImageScrollView.centerXAnchor).isActive = true
        galleryImageContentView.centerYAnchor.constraint(equalTo: galleryImageScrollView.centerYAnchor).isActive = true
        galleryImageContentView.widthAnchor.constraint(equalTo: galleryImageScrollView.widthAnchor).isActive = true
        galleryImageContentView.topAnchor.constraint(equalTo: galleryImageScrollView.topAnchor).isActive = true
        galleryImageContentView.bottomAnchor.constraint(equalTo: galleryImageScrollView.bottomAnchor).isActive = true
    }
    
    func showImage() {
        imageToShow.image = imageNeeded
        galleryImageContentView.addSubview(imageToShow)
        createPortraitImageLayout()
    }
    
    func createPortraitImageLayout() {
        imageToShow.topAnchor.constraint(equalTo: galleryImageContentView.topAnchor).isActive = true
        imageToShow.bottomAnchor.constraint(equalTo: galleryImageContentView.bottomAnchor).isActive = true
        imageToShow.leadingAnchor.constraint(equalTo: galleryImageContentView.leadingAnchor).isActive = true
        imageToShow.centerXAnchor.constraint(equalTo: galleryImageContentView.centerXAnchor).isActive = true
        imageToShow.centerYAnchor.constraint(equalTo: galleryImageContentView.centerYAnchor).isActive = true
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageToShow
    }
    
}
