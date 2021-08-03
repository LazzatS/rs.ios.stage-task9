//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Lazzat Seiilova
// On: 01.08.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class MainTabViewController: UITabBarController {

    let itemsVC = ItemsCollectionViewController()
    let settingsVC = SettingsViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "CustomWhiteGray")
        createTabBar()
    }
    
    func createTabBar() {
        self.setViewControllers([itemsVC, settingsVC], animated: false)
        
        // create tab bar titles
        itemsVC.title = "Items"
        settingsVC.title = "Settings"
        self.tabBar.tintColor = UIColor.red
        self.tabBar.unselectedItemTintColor = UIColor(named: "CustomGray")
        
        // create tab bar images
        guard let items = self.tabBar.items else { return }
        let images = ["square.grid.2x2", "gear"]
        
        for item in 0..<images.count {
            items[item].image = UIImage(systemName: images[item])
        }
    }
    
}
