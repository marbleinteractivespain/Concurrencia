//
//  CreateCategoryRequest.swift
//  DiscourseClientApp
//
//  Created by DAVID DE LA PUENTE on 22/7/21.
//

import Foundation

struct CreateCategoryRequest: APIRequest {
    typealias Response = CreateCategoryResponse
    
    let category: String
    
    init(category: String) {
        self.category = category
    }
    
    var method: Method{
        return .POST
    }
    
    var path: String {
        return "/categories.json"
    }
    
    var parameters: [String : String]{
        return [:]
    }
    
    var headers: [String : String]{
        return [:]
    }
    
    var body: [String : Any]{
        return [
            "name": category,
        ]
    }
}
