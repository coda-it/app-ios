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

struct Api {    
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
