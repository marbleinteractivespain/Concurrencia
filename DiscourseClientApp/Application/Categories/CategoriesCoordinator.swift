//
//  CategoriesCoordinator.swift
//  DiscourseClientApp
//
//  Created by DAVID DE LA PUENTE on 17/7/21.
//

import Foundation
import UIKit

class CategoriesCoordinator: Coordinator {
    var navigator: UINavigationController
    let categoryUseCases: CategoriesUseCases
    let dataManager = DataManager(remoteDataManager: RemoteDataManager())
    
    let createCategoryUseCases: CreateCategoryUseCases = DataManager(remoteDataManager: RemoteDataManager())
    
    init(navigator: UINavigationController, categoriesUseCases: CategoriesUseCases) {
        self.navigator = navigator
        self.categoryUseCases = categoriesUseCases
    }
    
    func start() {
        let categoryViewModel = CategoriesViewModel(useCases: categoryUseCases)
        let categoryViewController = CategoriesViewController(viewModel: categoryViewModel)
        
        categoryViewController.title = "Categories"
        categoryViewModel.view = categoryViewController
        categoryViewModel.coordinator = self
        navigator.pushViewController(categoryViewController, animated: false)
    }
    
    func didSelectCategory(category: Int) {
        let categoryDetailCoordinator = CategoryDetailCoordinator(navigator: navigator, categoryId: category, useCases: dataManager)
        categoryDetailCoordinator.start()
    }
    
    func pressedButton(){
        let createCategoryCoordinator = CreateCategoryCoordinator(navigator: navigator, createCategoryUseCases: createCategoryUseCases)
        createCategoryCoordinator.start()
    }
}

