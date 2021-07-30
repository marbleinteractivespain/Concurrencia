//  APIRequest.swift
//  DiscourseClientApp
//
//  Created by David de la Puente on 14/7/21.
//

import Foundation

enum Method: String {
    case GET
    case POST
    case PUT
    case DELETE
}

protocol APIRequest {
    associatedtype Response: Codable
    var method: Method { get }
    var path: String { get }
    var parameters: [String:String] { get }
    var headers: [String:String] { get }
    var body: [String:Any] { get }
}

extension APIRequest {
    var apiURL: String {
        return ConstantsApp.urlBase
    }
    
    var baseURL: URL {
        guard let baseURL = URL(string: apiURL) else {
            fatalError("URL not valid")
        }
        return baseURL
    }
    
    func requestWithBaseUrl() -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        
        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            fatalError("Not able to create components")
        }
        if !parameters.isEmpty {
            components.queryItems = parameters.map { key, value in URLQueryItem(name: key, value: value) }
        }
        
        guard let finalUrl = components.url else {
            fatalError("Unable to get final url")
        }
        
        var request = URLRequest(url: finalUrl)
        request.httpMethod = method.rawValue
        if !body.isEmpty {
            let jsonData = try? JSONSerialization.data(withJSONObject: body)
            request.httpBody = jsonData
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(ConstantsApp.ApiUsername, forHTTPHeaderField: "Api-Username")
        request.addValue(ConstantsApp.ApiKey, forHTTPHeaderField: "Api-Key")
        
        return request
    }
}
