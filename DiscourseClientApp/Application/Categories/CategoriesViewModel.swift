//
//  TopicViewModel.swift
//  DiscourseClientApp
//
//  Created by DAVID DE LA PUENTE on 17/7/21.
//

import Foundation

protocol CategoriesViewProtocol: AnyObject {
    func categoriesFetched()
    func errorFetchingCategories()
}

class CategoriesViewModel: ViewModel {
    typealias View = CategoriesViewProtocol
    typealias Coordinator = CategoriesCoordinator
    typealias UseCases = CategoriesUseCases
    
    var view: View?
    var coordinator: Coordinator?
    var useCases: UseCases
    
    var categoryCellViewModels: [CategoryCellViewModel] = []
    
    init(useCases: CategoriesUseCases) {
        self.useCases = useCases
    }
    
    func viewDidLoad() {
        useCases.fetchAllCategories { [weak self] result in
            switch result {
            case .success(let response):
                guard let response = response else { return }
                self?.categoryCellViewModels = response.categoryList.categories.map { CategoryCellViewModel(category: $0)}
                self?.view?.categoriesFetched()
            case .failure:
                self?.view?.errorFetchingCategories()
            }
        }
    }
    
    func numberOfSections() -> Int {
        return 1
    }

    func numberOfRows(in section: Int) -> Int {
        return categoryCellViewModels.count
    }

    func cellViewModel(at indexPath: IndexPath) -> CategoryCellViewModel? {
        guard indexPath.row < categoryCellViewModels.count else { return nil }
        return categoryCellViewModels[indexPath.row]
    }

    func didSelecRow(at indexPath: IndexPath){
        guard indexPath.row < categoryCellViewModels.count else { return }
        guard let categoryID = categoryCellViewModels[indexPath.row].idLabel else { return }
       
        coordinator?.didSelectCategory(category: categoryID)
    }
    
    func onTapAddButton(){
        coordinator?.pressedButton()
    }
    
}
