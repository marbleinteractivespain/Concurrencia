//
//  CreateTopicViewModel.swift
//  DiscourseClient
//
//  Created by DAVID DE LA PUENTE on 20/7/21.
//

import Foundation

protocol CreateTopicViewProtocol {}


class CreateTopicViewModel: ViewModel {
    typealias View = CreateTopicViewProtocol
    typealias Coordinator = CreateTopicCoordinator
    typealias UseCases = CreateTopicUseCases
    
    var view: CreateTopicViewProtocol?
    var coordinator: CreateTopicCoordinator?
    var useCases: UseCases
    
    var onCreateTopicSuccess: (() -> ())?
    var onCreateTopicFail: ((String) -> ())?
    
    init(createTopicUseCases: CreateTopicUseCases) {
        useCases = createTopicUseCases
    }
    
    func onTapSubmitButton(title: String, raw: String){
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let createAt =  dateFormatter.string(from: Date())
        
        useCases.createTopic(title: title, raw: title, createdAt: createAt) {[weak self] result in
            switch result{
            case .success:
                self?.onCreateTopicSuccess?()

            case .failure(let error):
                guard let responseError = error as? DiscourseClientApp.SessionAPIError else {
                    self?.onCreateTopicFail?("")
                    return
                }
                var message = error.localizedDescription
                
                switch responseError {
                case .apiError(let msg): message = msg.errors?.first ?? error.localizedDescription
                case .httpError(let code): message = "Error Code: \(code)"
                }
                
                self?.onCreateTopicFail?(message)
            }
        }
    }
}
