//
//  UsersUseCases.swift
//  DiscourseClientApp
//
//  Created by David de la Puente on 14/7/21.
//

import Foundation

protocol UsersUseCases {
    func fetchAllUsers(completion: @escaping (Result<UsersResponse?, Error>) -> ())
}

extension DataManager: UsersUseCases {
    func fetchAllUsers(completion: @escaping (Result<UsersResponse?, Error>) -> ()) {
        remoteDataManager.fetchAllUsers(completion: completion)
    }
}

extension RemoteDataManager: UsersUseCases {
    func fetchAllUsers(completion: @escaping (Result<UsersResponse?, Error>) -> ()) {
        let request = UsersRequest()
        session.request(request: request) { result in
            completion(result)
        }
    }
}


