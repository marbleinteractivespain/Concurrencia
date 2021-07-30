//
//  CreateCategoryViewModel.swift
//  DiscourseClientApp
//
//  Created by DAVID DE LA PUENTE on 22/7/21.
//

import Foundation

protocol CreateCategoryViewProtocol {}

class CreateCategoryViewModel: ViewModel {
    var view: CreateCategoryViewProtocol?
    var coordinator: CreateCategoryCoordinator?
    var useCases: UseCases
    
    typealias View = CreateCategoryViewProtocol
    typealias Coordinator = CreateCategoryCoordinator
    typealias UseCases = CreateCategoryUseCases
    
    var onCreateCategorySuccess: (() -> ())?
    var onCreateCategoryFail: ((String) -> ())?
    
    init(createCategoryUseCases: CreateCategoryUseCases) {
        useCases = createCategoryUseCases
    }
    
    func onTapButtonSendNewCategory(category: String){
        
        useCases.createCategory(category: category) {[weak self] result in
            switch result{
            case .success:
                self?.onCreateCategorySuccess?()
            case .failure(let error):
                
                guard let responseError = error as? DiscourseClientApp.SessionAPIError else {
                    self?.onCreateCategoryFail?("")
                    return
                }
                var message = error.localizedDescription
                
                switch responseError {
                case .apiError(let msg): message = msg.errors?.first ?? error.localizedDescription
                case .httpError(let code): message = "Error Code: \(code)"
                }
                
                self?.onCreateCategoryFail?(message)
            }
        }
    }
}
