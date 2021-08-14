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
    
    let closeButton = UIButton()
    var hideCloseButton: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupScrollView()
        showImage()
        callGestureRecognizer()
        createCloseButton()
    }
    
    func setupScrollView() {
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
        
        imageToShow.topAnchor.constraint(equalTo: galleryImageContentView.topAnchor).isActive = true
        imageToShow.bottomAnchor.constraint(equalTo: galleryImageContentView.bottomAnchor).isActive = true
        imageToShow.leadingAnchor.constraint(equalTo: galleryImageContentView.leadingAnchor).isActive = true
        imageToShow.centerXAnchor.constraint(equalTo: galleryImageContentView.centerXAnchor).isActive = true
        imageToShow.centerYAnchor.constraint(equalTo: galleryImageContentView.centerYAnchor).isActive = true
    }
    
    func createCloseButton() {
        closeButton.frame = CGRect(x: 350, y: 30, width: 40, height: 40)
        closeButton.setImage(UIImage.init(systemName: "xmark"), for: .normal)
        closeButton.titleLabel?.font = UIFont(name: "SF Pro Display", size: 18)
        closeButton.setTitleColor(.white, for: .normal)
        closeButton.tintColor = .white
        closeButton.layer.cornerRadius = closeButton.frame.size.width / 2
        closeButton.layer.borderColor = UIColor.white.cgColor
        closeButton.layer.borderWidth = 1
        
        galleryImageContentView.addSubview(closeButton)
        closeButton.addTarget(self, action: #selector(closeView), for: .touchUpInside)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        closeButton.topAnchor.constraint(equalTo: galleryImageContentView.topAnchor, constant: 30).isActive = true
        closeButton.rightAnchor.constraint(equalTo: galleryImageContentView.rightAnchor, constant: -25).isActive = true
    }
    
    func callGestureRecognizer() {
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(gestureCalled(_:)))
        gestureRecognizer.numberOfTapsRequired = 1
        gestureRecognizer.numberOfTouchesRequired = 1
        imageToShow.addGestureRecognizer(gestureRecognizer)
        imageToShow.isUserInteractionEnabled = true
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageToShow
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        if scrollView.zoomScale > 1 {
            if let image = imageToShow.image {
                let ratioWidth = imageToShow.frame.width / image.size.width
                let ratioHeight = imageToShow.frame.height / image.size.height
                
                let ratio = ratioWidth < ratioHeight ? ratioWidth : ratioHeight
                let newWidth = image.size.width * ratio
                let newHeight = image.size.height * ratio
                
                let conditionLeft = newWidth * scrollView.zoomScale > imageToShow.frame.width
                let left = 0.5 * (conditionLeft ? newWidth - imageToShow.frame.width : (scrollView.frame.width - scrollView.contentSize.width))
                
                let conditionTop = newHeight * scrollView.zoomScale > imageToShow.frame.height
                let top = 0.5 * (conditionTop ? newHeight - imageToShow.frame.height : (scrollView.frame.height - scrollView.contentSize.height))
                scrollView.contentInset = UIEdgeInsets(top: top, left: left, bottom: top, right: left)
                
            }
        } else {
            scrollView.contentInset = .zero
        }
    }
    
    @objc func closeView() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func gestureCalled(_ gesture: UITapGestureRecognizer) {
        hideCloseButton.toggle()
        if hideCloseButton {
            closeButton.isHidden = true
        }
        if !hideCloseButton {
            closeButton.isHidden = false
        }
    }
}
