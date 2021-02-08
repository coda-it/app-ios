//
//  appApp.swift
//  app
//
//  Created by Oskar on 07/02/2021.
//

import SwiftUI

@main
struct appApp: App {
    @State var isLogged = false
    var userUsecases: UserUsecases
    
    var body: some Scene {
        WindowGroup {
            ContentView(userUsecases: userUsecases)
        }
    }
    
    init() {
        let api = Api()
        let userRepository = UserRepository(api: api)
        self.userUsecases = UserUsecases(userRepository: userRepository)
    }
}
