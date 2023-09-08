//
//  SceneDelegate.swift
//  TrackListApp
//
//  Created by Matvei Khlestov on 01.06.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.makeKeyAndVisible()
        let trackListVC = UINavigationController(rootViewController: TrackListViewController())
        window.rootViewController = trackListVC
        self.window = window
    }
}

