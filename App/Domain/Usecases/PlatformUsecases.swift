//
//  platformUsecases.swift
//  app
//
//  Created by Oskar on 11/08/2021.
//

struct PlatformUsecases {
    let config: Config
    
    func getAPIAddress () -> String {
        return self.config.value(for: "API_ADDRESS")
    }
}
