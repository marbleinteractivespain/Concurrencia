//
//  CategoryDetailCoordinator.swift
//  DiscourseClientApp
//
//  Created by DAVID DE LA PUENTE on 21/7/21.
//

import UIKit


class CategoryDetailCoordinator: Coordinator {
    var navigator: UINavigationController
    let categoryId: Int
    let useCases: CategoryDetailUseCases

    
    init(navigator: UINavigationController, categoryId: Int, useCases: CategoryDetailUseCases) {
        self.navigator = navigator
        self.categoryId = categoryId
        self.useCases = useCases
    }
    
    func start() {
        let categoryDetailViewModel = CategoryDetailViewModel(categoryId: categoryId, useCases: useCases)
        let categoryDetailViewController = CategoryDetailViewController(viewModel: categoryDetailViewModel)
        categoryDetailViewModel.coordinator = self
        categoryDetailViewController.title = "Category Detail"
        
        navigator.pushViewController(categoryDetailViewController, animated: false)
    }
}
