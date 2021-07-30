//
//  TopicDetailViewModel.swift
//  DiscourseClientApp
//
//  Created by DAVID DE LA PUENTE on 19/7/21.


import Foundation

protocol TopicDetailViewProtocol: AnyObject {}

struct TopicDetailViewStruct {
    let topicId : String
    let topicName : String
    let postsNumber : String
    let topicCanBeDeleted: Bool
}

class TopicDetailViewModel: ViewModel {
    typealias View = TopicDetailViewProtocol
    typealias Coordinator = TopicDetailCoordinator
    typealias UseCases = TopicDetailUseCases
    
    //no lo vamos a utilizar porque usamos los closures.
    weak var view: TopicDetailViewProtocol?
    var coordinator: TopicDetailCoordinator?
    var useCases: UseCases
    
    let topicId: Int
    
    var onGetTopicSuccess: ((TopicDetailViewStruct) -> ())?
    var onGetTopicFail: (() -> ())?
    var onDeleteTopicSuccess: (() -> ())?
    var onDeleteTopicFail: (() -> ())?

    
    init(topicId: Int, useCases: TopicDetailUseCases) {
        self.topicId = topicId
        self.useCases = useCases
    }
    

    func viewDidLoad() {
        useCases.fetchTopic(id: topicId) { [weak self] result in
            switch result {
            case .success(let response):
                guard let response = response else { return }
                let topicDetailViewStruct = TopicDetailViewStruct(topicId: "\(response.id)", topicName: response.title, postsNumber: "\(response.postsCount)", topicCanBeDeleted: response.details.canDelete ?? false)
                self?.onGetTopicSuccess?(topicDetailViewStruct)
            case .failure:
                self?.onGetTopicFail?()
            }
        }
    }
    
    func onTapDeleteButton() {
        useCases.deleteTopic(id: topicId) { [weak self] result in
            switch result {
            case .success:
                self?.coordinator?.onDeleteTopicSuccess()
                self?.onDeleteTopicSuccess?()
            case .failure:
                self?.onDeleteTopicFail?()
            }
        }
    }
}

