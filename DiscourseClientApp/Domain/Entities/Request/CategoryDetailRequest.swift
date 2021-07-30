//
//  CategoryDetailResponse.swift
//  DiscourseClientApp
//
//  Created by DAVID DE LA PUENTE on 21/7/21.
//

import Foundation

struct CategoryDetailRequest: APIRequest {
    
    let id: Int
    
    init(id: Int){
        self.id = id
    }
    
    var method: Method {
        return .GET
    }
    var path: String {
        return "/c/\(id)/show.json"
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
    
    typealias Response = CategoryDetailResponse
}

