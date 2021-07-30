//
//  UsersRequest.swift
//  DiscourseClientApp
//
//  Created by David de la Puente on 14/7/21.
//

import Foundation

class UsersRequest: APIRequest {
    typealias Response = UsersResponse
    
    var method: Method {
        return .GET
    }
    
    var path: String {
        return "/directory_items.json"
    }
    
    var parameters: [String:String] {
        return ["period": "all"]
    }
    
    var headers: [String:String] {
        return [:]
    }
    
    var body: [String:Any] {
        return [:]
    }
}
