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

    var imageNeeded = UIImage()
    
    var imageToShow: UIImageView = {
        let imageToShow = UIImageView()
        imageToShow.contentMode = .scaleAspectFill
        imageToShow.clipsToBounds = true
        
        return imageToShow
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        showImage()
    }
    
    func showImage() {
        imageToShow.image = imageNeeded
        view.addSubview(imageToShow)
        let imageWidth = view.frame.size.width
        
        imageToShow.frame.size = CGSize(width: imageWidth, height: imageWidth)
        imageToShow.frame.origin = CGPoint(x: 0, y: view.frame.size.height / 4)
    }
    
}
