//
//  CategoriesRequest.swift
//  DiscourseClientApp
//
//  Created by DAVID DE LA PUENTE on 17/7/21.
//

import Foundation

class CategoriesRequest: APIRequest {
    typealias Response = CategoriesResponse
    
    var method: Method {
        return .GET
    }
    
    var path: String {
        return "/categories.json"
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

