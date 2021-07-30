//
//  TopicDetailCoordinator.swift
//  DiscourseClientApp
//
//  Created by DAVID DE LA PUENTE on 19/7/21.
//

import UIKit

class TopicDetailCoordinator: Coordinator {
    var navigator: UINavigationController
    let topicId: Int
    let useCases: TopicDetailUseCases

    
    init(navigator: UINavigationController, topicId: Int, useCases: TopicDetailUseCases) {
        self.navigator = navigator
        self.topicId = topicId
        self.useCases = useCases
    }
    
    func start() {
        let topicDetailViewModel = TopicDetailViewModel(topicId: topicId, useCases: useCases)
        let topicDetailViewController = TopicDetailViewController(viewModel: topicDetailViewModel)
        topicDetailViewModel.coordinator = self
        topicDetailViewController.title = "Topic Detail"
        
        navigator.pushViewController(topicDetailViewController, animated: false)
    }
    
    func onDeleteTopicSuccess() {
        navigator.popViewController(animated: false)
    }
}

