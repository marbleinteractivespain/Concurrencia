//
//  UserDetailUseCases.swift
//  DiscourseClientApp
//
//  Created by DAVID DE LA PUENTE on 18/7/21.
//

import Foundation

protocol UserDetailUseCases {
    func fetchUser(username: String, completion: @escaping (Result<UserDetailResponse?, Error>) -> ())
    func updateUserName(username: String, name: String, completion: @escaping(Result<UpdateUserNameResponse?, Error>) -> ())
}
extension DataManager: UserDetailUseCases {
    func updateUserName(username: String, name: String, completion: @escaping (Result<UpdateUserNameResponse?, Error>) -> ()) {
        remoteDataManager.updateUserName(username: username, name: name, completion: completion)
    }

    func fetchUser(username: String, completion: @escaping (Result<UserDetailResponse?, Error>) -> ()) {
        remoteDataManager.fetchUser(username: username, completion: completion)
    }
}

extension RemoteDataManager: UserDetailUseCases {
    func updateUserName(username: String, name: String, completion: @escaping (Result<UpdateUserNameResponse?, Error>) -> ()) {
        let request = UpdateUserNameRequest(username: username, name: name)
        session.request(request: request) { result in
            completion(result)
        }
    }

    func fetchUser(username: String, completion: @escaping (Result<UserDetailResponse?, Error>) -> ()) {
        let request = UserDetailRequest(username: username)
        session.request(request: request) { result in
            completion(result)
        }
    }

}
