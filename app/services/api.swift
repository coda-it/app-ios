//
//  api.swift
//  app
//
//  Created by Oskar on 08/02/2021.
//

import Foundation

struct Api {
    func get<T: Codable>(url: String, type: T.Type, completion: @escaping (T?) -> ()) {
        let urlTarget = URL(string: url)!
        let request = URLRequest(url: urlTarget)
        
        let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
            guard let data = data else {
                completion(nil)
                return
            }
            
            do {
                let response = try JSONDecoder().decode(T.self, from: data)
                completion(response)
                return
            } catch {
                completion(nil)
            }
        }
        
        task.resume()
    }
    
    func post<T: Codable>(url: String, body: String, completion: @escaping (T?) -> ()) {
        let urlTarget = URL(string: url)!
        
        var request = URLRequest(url: urlTarget)
        request.httpMethod = "POST"
        request.httpBody = body.data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
            guard let data = data else {
                completion(nil)
                return
            }
            
            do {
                let response = try JSONDecoder().decode(T.self, from: data)
                completion(response)
                return
            } catch {
                completion(nil)
            }
        }
        
        task.resume()
    }
}
