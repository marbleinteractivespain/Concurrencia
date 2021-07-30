//
//  TopicsRequest.swift
//  DiscourseClientApp
//
//  Created by DAVID DE LA PUENTE on 17/7/21.
//

import Foundation

class TopicsRequest: APIRequest {
    typealias Response = TopicsResponse
    
    var method: Method {
        return .GET
    }
    
    var path: String {
        return "/latest.json"
    }
    
    var parameters: [String:String] {
       return [:]
    }
    
    var headers: [String:String] {
        return [:]
    }
    
    var body: [String:Any] {
        return [:]
    }
}

