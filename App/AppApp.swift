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
    var categoryUsecases: CategoryUsecases
    var postUsecases: PostUsecases
    var platformUsecases: PlatformUsecases
    
    var body: some Scene {
        WindowGroup {
            ContentView(posts: [], categories: [], userUsecases: self.userUsecases, categoryUsecases: self.categoryUsecases, postUsecases: self.postUsecases, platformUsecases: self.platformUsecases)
        }
    }
    
    init() {
        let api = Api()
        
        self.platformUsecases = PlatformUsecases(config: Config())
        
        let userRepository = UserRepository(api: api)
        self.userUsecases = UserUsecases(userRepository: userRepository)
        
        let categoryRepository = CategoryRepository(api: api)
        self.categoryUsecases = CategoryUsecases(categoryRepository: categoryRepository)
        
        let postRepository = PostRepository(api: api)
        self.postUsecases = PostUsecases(postRepository: postRepository)
    }
}
