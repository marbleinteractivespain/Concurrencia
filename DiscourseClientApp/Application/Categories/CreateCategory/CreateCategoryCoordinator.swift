//
//  CreateCategoryCoordinator.swift
//  DiscourseClientApp
//
//  Created by DAVID DE LA PUENTE on 22/7/21.
//

import Foundation
import UIKit

class CreateCategoryCoordinator: Coordinator {
    var navigator: UINavigationController
    let createCategoryUseCases : CreateCategoryUseCases

    
    init(navigator: UINavigationController, createCategoryUseCases: CreateCategoryUseCases) {
        self.navigator = navigator
        self.createCategoryUseCases = createCategoryUseCases
    }
    
    func start() {
        
        let createCategoryViewModel = CreateCategoryViewModel(createCategoryUseCases: createCategoryUseCases)
        let createCategoryViewController = CreateCategoryViewController(viewModel: createCategoryViewModel)
        
        createCategoryViewController.title = "Create Category"
        createCategoryViewModel.view = createCategoryViewController
        createCategoryViewModel.coordinator = self
        
        createCategoryViewController.modalPresentationStyle = .currentContext
        let navigationControllerCategory = UINavigationController(rootViewController: createCategoryViewController)
        navigator.present(navigationControllerCategory, animated: true, completion: nil)
        
    }
}
