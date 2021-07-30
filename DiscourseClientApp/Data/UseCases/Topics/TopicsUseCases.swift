//
//  TopicsUseCases.swift
//  DiscourseClientApp
//
//  Created by DAVID DE LA PUENTE on 17/7/21.
//

import Foundation

protocol TopicsUseCases {
    func fetchAllTopics(completion: @escaping (Result<TopicsResponse?, Error>) -> ())
}

extension DataManager: TopicsUseCases {
    func fetchAllTopics(completion: @escaping (Result<TopicsResponse?, Error>) -> ()) {
        remoteDataManager.fetchAllTopics(completion: completion)
    }
}

extension RemoteDataManager: TopicsUseCases {
    func fetchAllTopics(completion: @escaping (Result<TopicsResponse?, Error>) -> ()) {
        let request = TopicsRequest()
        session.request(request: request) { result in
            completion(result)
        }
    }
}

