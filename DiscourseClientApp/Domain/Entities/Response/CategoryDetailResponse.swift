//
//  CategoryDetailResponse.swift
//  DiscourseClientApp
//
//  Created by DAVID DE LA PUENTE on 21/7/21.
//

import Foundation

// MARK: - CategoryDetailResponse
struct CategoryDetailResponse: Codable {
    let category: CategoryDetaill
}

// MARK: - Category
struct CategoryDetaill: Codable {
    let id: Int
    let name, color: String
}

