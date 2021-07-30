//
//  CategoryDetailUseCases.swift
//  DiscourseClientApp
//
//  Created by DAVID DE LA PUENTE on 21/7/21.
//

import Foundation

protocol CategoryDetailUseCases {
    func fetchCategory(id: Int, completion: @escaping(Result<CategoryDetailResponse?, Error>) -> ())
}


extension DataManager: CategoryDetailUseCases {
    
    func fetchCategory(id: Int, completion: @escaping (Result<CategoryDetailResponse?, Error>) -> ()) {
        remoteDataManager.fetchCategory(id: id, completion: completion)
    }
}

extension RemoteDataManager: CategoryDetailUseCases {
    
    func fetchCategory(id: Int,completion: @escaping (Result<CategoryDetailResponse?, Error>) -> ()) {
        let fetchCategoryRequest = CategoryDetailRequest(id: id)
        session.request(request: fetchCategoryRequest, completion: completion)
    }
}
