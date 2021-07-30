//
//  SceneDelegate.swift
//  DiscourseClientApp
//
//  Created by David de la Puente on 14/7/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    lazy var appCoordinator: AppCoodinator = {
        guard let window = self.window else { fatalError() }
        let coordinator = AppCoodinator(window: window)
        return coordinator
    }()


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
        
        guard let windowScene = (scene as? UIWindowScene) else {return}
        let sceneWindow = UIWindow(windowScene: windowScene)
        window = sceneWindow
        appCoordinator.start()
    }

}

