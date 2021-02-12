//
//  api.swift
//  app
//
//  Created by Oskar on 08/02/2021.
//

import Foundation

struct UserSession: Codable {
    var isSession: Bool
}
struct Embedded: Codable {
    var posts: Array<PostModel>
}
struct PostsResponse: Codable {
    var _embedded: Embedded
}

struct Api {
    func get(url: String, completion: @escaping (Array<PostModel>) -> ()) {
        let urlTarget = URL(string: url)!
        let request = URLRequest(url: urlTarget)
        
        let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
            guard let data = data else {
                completion([])
                return
            }
            
            do {
                let agentResponse = try JSONDecoder().decode(PostsResponse.self, from: data)
                completion(agentResponse._embedded.posts)
                return
            } catch {
                completion([])
            }
        }
        
        task.resume()
    }
    
    func post(url: String, body: String, completion: @escaping (Bool) -> ()) {
        let urlTarget = URL(string: url)!
        
        var request = URLRequest(url: urlTarget)
        request.httpMethod = "POST"
        request.httpBody = body.data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
            guard let data = data else {
                completion(false)
                return
            }
            
            do {
                let userSession = try JSONDecoder().decode(UserSession.self, from: data)
                completion(userSession.isSession)
                return
            } catch {
                completion(false)
            }
        }
        
        task.resume()
    }
}
