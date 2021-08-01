//
// 📰 🐸
// Project: RSSchool_T9
//
// Author: Uladzislau Volchyk
// On: 23.07.21
// Modified by: Lazzat Seiilova
// On: 1.08.21
//
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        window = UIWindow(frame: UIScreen.main.bounds)
        let rootVC = MainTabViewController()
        window?.rootViewController = rootVC
        window?.windowScene = windowScene
        window?.makeKeyAndVisible()
    }
}

