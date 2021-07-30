//
//  CreateTopicUseCases.swift
//  DiscourseClientApp
//
//  Created by DAVID DE LA PUENTE on 20/7/21.
//

import Foundation

protocol CreateTopicUseCases {
    func createTopic(title: String, raw: String, createdAt: String, completion: @escaping (Result<CreateTopicResponse?, Error>) -> ())
}

extension DataManager: CreateTopicUseCases {
    func createTopic(title: String, raw: String, createdAt: String, completion: @escaping (Result<CreateTopicResponse?, Error>) -> ()) {
        remoteDataManager.createTopic(title: title, raw: raw, createdAt: createdAt, completion: completion)
    }
}

extension RemoteDataManager: CreateTopicUseCases {
    func createTopic(title: String, raw: String, createdAt: String, completion: @escaping (Result<CreateTopicResponse?, Error>) -> ()) {
        let request = CreateTopicRequest(title: title, raw: raw, createAt: createdAt)
        session.request(request: request, completion: completion)
    }
}
