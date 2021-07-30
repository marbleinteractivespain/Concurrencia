//
//  CcategoryDetailViewModel.swift
//  DiscourseClientApp
//
//  Created by DAVID DE LA PUENTE on 21/7/21.
//

import Foundation

protocol CategoryDetailViewProtocol: AnyObject {}

struct CategoryDetailViewStruct {
    let categoryId : String
    let categoryName : String
    let categoryColor : String
}


class CategoryDetailViewModel: ViewModel {
    typealias View = CategoryDetailViewProtocol
    typealias Coordinator = CategoryDetailCoordinator
    typealias UseCases = CategoryDetailUseCases
    
    //no lo vamos a utilizar porque usamos los closures.
    weak var view: CategoryDetailViewProtocol?
    var coordinator: CategoryDetailCoordinator?
    var useCases: UseCases
    
    let categoryId: Int
    
    var onGetCategoryDetaillSuccess: ((CategoryDetailViewStruct) -> ())?
    var onGetCategoryDetailFail: (() -> ())?

    
    init(categoryId: Int, useCases: CategoryDetailUseCases) {
        self.categoryId = categoryId
        self.useCases = useCases
    }
    
    func viewDidLoad(){
        
        useCases.fetchCategory(id: categoryId){ [weak self] result in
            switch result {
                case .success(let response):
                    guard let response = response else { return }
                    let categoryDetailViewSctruct = CategoryDetailViewStruct(categoryId: "\(response.category.id)", categoryName: response.category.name, categoryColor: response.category.color)
                    self?.onGetCategoryDetaillSuccess?(categoryDetailViewSctruct)
                    
                case .failure:
                    self?.onGetCategoryDetailFail?()
            }
        }
    }
    
}
