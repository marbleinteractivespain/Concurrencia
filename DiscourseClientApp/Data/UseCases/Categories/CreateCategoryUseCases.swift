//
//  CreateCategoryUseCases.swift
//  DiscourseClientApp
//
//  Created by DAVID DE LA PUENTE on 22/7/21.
//

import Foundation
protocol CreateCategoryUseCases {
    func createCategory(category: String, completion: @escaping (Result<CreateCategoryResponse?, Error>) -> ())
}

extension DataManager: CreateCategoryUseCases {
    func createCategory(category: String, completion: @escaping (Result<CreateCategoryResponse?, Error>) -> ()) {
        remoteDataManager.createCategory(category: category, completion: completion)
    }
}

extension RemoteDataManager: CreateCategoryUseCases {
    func createCategory(category: String, completion: @escaping (Result<CreateCategoryResponse?, Error>) -> ()) {
        let request = CreateCategoryRequest(category: category)
        session.request(request: request, completion: completion)
    }
}
