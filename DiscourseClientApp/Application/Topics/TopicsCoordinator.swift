//
//  TopicsCoordinator.swift
//  DiscourseClientApp
//
//  Created by DAVID DE LA PUENTE on 17/7/21.
//

import Foundation
import UIKit

class TopicsCoordinator: Coordinator {
    var navigator: UINavigationController
    let topicUseCases: TopicsUseCases
    let topicDetailUseCases: TopicDetailUseCases = DataManager(remoteDataManager: RemoteDataManager())
    
    let createTopicUseCases: CreateTopicUseCases = DataManager(remoteDataManager: RemoteDataManager())
    
    init(navigator: UINavigationController, topicsUseCases: TopicsUseCases ) {
        self.navigator = navigator
        self.topicUseCases = topicsUseCases
    
    }
    
    func start() {
        let topicViewModel = TopicViewModel(useCases: topicUseCases)
        let topicViewController = TopicsViewController(viewModel: topicViewModel)
        
        topicViewController.title = "Topics"
        topicViewModel.view = topicViewController
        topicViewModel.coordinator = self
        navigator.pushViewController(topicViewController, animated: false)
    }
    
    func didSelect(topic: Topic){
        let topicDetailCoordinator = TopicDetailCoordinator(navigator: navigator, topicId: topic.id, useCases: topicDetailUseCases)
        topicDetailCoordinator.start()
    }
    
    func pressedButton(){
        let createTopicCoordinator = CreateTopicCoordinator(navigator: navigator, createTopicUseCases: createTopicUseCases)
        createTopicCoordinator.start()
    }
}
