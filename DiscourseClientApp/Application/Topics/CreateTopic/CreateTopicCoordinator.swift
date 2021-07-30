//
//  CreateTopicCoordinator.swift
//  DiscourseClient
//
//  Created by DAVID DE LA PUENTE on 20/7/21.
//

import UIKit


class CreateTopicCoordinator: Coordinator {
    var navigator: UINavigationController
    let createTopicUseCases : CreateTopicUseCases

    
    init(navigator: UINavigationController, createTopicUseCases: CreateTopicUseCases) {
        self.navigator = navigator
        self.createTopicUseCases = createTopicUseCases
    }
    
    func start() {
        let createTopicViewModel = CreateTopicViewModel(createTopicUseCases: createTopicUseCases)
        let createTopicViewController = CreateTopicViewController(viewModel: createTopicViewModel)
        
        createTopicViewController.title = "Create Topic"
        createTopicViewModel.view = createTopicViewController
        createTopicViewModel.coordinator = self
        navigator.pushViewController(createTopicViewController, animated: true)
        
        //NAVIGATOR CON MODAL
//        createTopicViewController.modalPresentationStyle = .currentContext
//        let navigationController = UINavigationController(rootViewController: createTopicViewController)
//        navigator.present(navigationController, animated: true, completion: nil)
        
    }
}
