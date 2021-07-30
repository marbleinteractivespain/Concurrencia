//
//  CategoryCellViewModel.swift
//  DiscourseClientApp
//
//  Created by DAVID DE LA PUENTE on 17/7/21.
//

import Foundation
import UIKit

protocol CategoryCellViewProtocol: AnyObject {}

class CategoryCellViewModel {
    weak var view: CategoryCellViewProtocol?
    let category: Category
    let idLabel: Int?
    let nameLabel: String?
    let colorCell: String?
    
    
    init(category: Category) {
        self.category = category
        self.idLabel = category.id
        self.nameLabel = category.name
        self.colorCell = category.color
    }
}

