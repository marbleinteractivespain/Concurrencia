//
//  TopicDetailRequest.swift
//  DiscourseClient
//
//  Created by David de la Puente on 19/7/21.
//

import Foundation

struct TopicDetailRequest: APIRequest {
    
    let id: Int
    
    init(id: Int){
        self.id = id
    }
    
    var method: Method {
        return .GET
    }
    
    var path: String {
        return "/t/\(id).json"
    }
    
    var parameters: [String : String] {
        return [:]
    }
    
    var body: [String : Any] {
        return [:]
    }
    
    var headers: [String : String] {
        return [:]
    }
    
    typealias Response = TopicDetailResponse
}
