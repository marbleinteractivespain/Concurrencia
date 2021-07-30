//
//  CreateTopicRequest.swift
//  DiscourseClientApp
//
//  Created by DAVID DE LA PUENTE on 20/7/21.
//

import Foundation

struct CreateTopicRequest: APIRequest {
    typealias Response = CreateTopicResponse
    
    let title: String
    let raw: String
    let createAt: String
    
    init(title: String, raw: String, createAt: String) {
        self.title = title
        self.raw = raw
        self.createAt = createAt
    }
    
    var method: Method{
        return .POST
    }
    
    var path: String {
        return "/posts.json"
    }
    
    var parameters: [String : String]{
        return [:]
    }
    
    var headers: [String : String]{
        return [:]
    }
    
    var body: [String : Any]{
        return [
            "title": title,
            "raw": raw,
            "created_at": createAt,
        ]
    }
    
   
}
