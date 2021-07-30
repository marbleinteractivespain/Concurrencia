//
//  CategoriesResponse.swift
//  DiscourseClientApp
//
//  Created by DAVID DE LA PUENTE on 17/7/21.
//

import Foundation


// MARK: - CategoriesResponse
struct CategoriesResponse: Codable {
    let categoryList: CategoryList

    enum CodingKeys: String, CodingKey {
        case categoryList = "category_list"
    }
}

// MARK: - CategoryList
struct CategoryList: Codable {
    let categories: [Category]
}

// MARK: - Category
struct Category: Codable {
    let id: Int
    let name, color, textColor: String

    enum CodingKeys: String, CodingKey {
        case id, name, color
        case textColor = "text_color"
    }
}
