//
//  DeleteTopicRequest.swift
//  DiscourseClientApp
//
//  Created by DAVID DE LA PUENTE on 20/7/21.
//

import Foundation

struct DeleteTopicRequest: APIRequest {
    typealias Response = DeleteTopicResponse
    
    let id: Int
    
    init(id: Int) {
        self.id = id
    }
    
    var method: Method{
        return .DELETE
    }
    
    var path: String {
        return "/t/-/\(id).json"
    }
    
    var parameters: [String : String]{
        return [:]
    }
    
    var headers: [String : String]{
        return [:]
    }
    
    var body: [String : Any]{
        return [:]
    }
    
   
}
