//
//  UsersCoordinator.swift
//  DiscourseClientApp
//
//  Created by David de la Puente on 14/7/21.
//

import Foundation
import UIKit

class UsersCoordinator: Coordinator {
    var navigator: UINavigationController
    let userUseCases: UsersUseCases
    
    let remoteDataManager = RemoteDataManager()
    lazy var userDetailUseCases: UserDetailUseCases = DataManager(remoteDataManager: remoteDataManager)
    
    init(navigator: UINavigationController, userUseCases: UsersUseCases) {
        self.navigator = navigator
        self.userUseCases = userUseCases
    }
    
    func start() {
        let userViewModel = UsersViewModel(useCases: userUseCases)
        let userViewController = UsersViewController(viewModel: userViewModel)
        
        userViewController.title = "Users"
        userViewModel.view = userViewController
        userViewModel.coordinator = self
        navigator.pushViewController(userViewController, animated: false)
    }
    
    func didSelect(username: String){
        let userDetailCoordinator = UserDetailCoordinator(navigator: navigator, username: username, useCases: userDetailUseCases)
        userDetailCoordinator.start()
    }
}
