//
//  TopicDetailUseCases.swift
//  DiscourseClientApp
//
//  Created by DAVID DE LA PUENTE on 19/7/21.
//

import Foundation

protocol TopicDetailUseCases {
    func fetchTopic(id: Int, completion: @escaping(Result<TopicDetailResponse?, Error>) -> ())
    func deleteTopic(id: Int, completion: @escaping(Result<DeleteTopicResponse?, Error>) -> ())
}

extension DataManager: TopicDetailUseCases {
    func deleteTopic(id: Int, completion: @escaping (Result<DeleteTopicResponse?, Error>) -> ()) {
        remoteDataManager.deleteTopic(id: id, completion: completion)
    }
    
    func fetchTopic(id: Int, completion: @escaping (Result<TopicDetailResponse?, Error>) -> ()) {
        remoteDataManager.fetchTopic(id: id, completion: completion)
    }
}

extension RemoteDataManager: TopicDetailUseCases {
    func deleteTopic(id: Int, completion: @escaping (Result<DeleteTopicResponse?, Error>) -> ()) {
        let deleteTopicRequest = DeleteTopicRequest(id: id)
        session.request(request: deleteTopicRequest, completion: completion)
    }
    
    func fetchTopic(id: Int, completion: @escaping (Result<TopicDetailResponse?, Error>) -> ()) {
        let fetchTopicRequest = TopicDetailRequest(id: id)
        session.request(request: fetchTopicRequest, completion: completion)
    }
}

