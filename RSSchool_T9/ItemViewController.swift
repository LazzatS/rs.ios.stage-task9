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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
}
