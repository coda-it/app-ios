//
//  userRepository.swift
//  app
//
//  Created by Oskar on 08/02/2021.
//

struct UserRepository {
    let api: Api
    
    func login(username: String, apiAddress: String, password: String, completion: @escaping (Bool) -> ()) {
        self.api.post(url: "\(apiAddress)/api/login",
                      body: "username=\(username)&password=\(password)",
                      completion: completion)
    }
}
