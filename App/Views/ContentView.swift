//
//  ContentView.swift
//  app
//
//  Created by Oskar on 07/02/2021.
//

import SwiftUI
import swift_utils

struct ContentView: View {
    @State var isLogged = false
    @State var isLoading = false
    @State var posts: Array<PostModel>
    @State var categories: Array<CategoryModel>
    
    var userUsecases: UserUsecases
    var categoryUsecases: CategoryUsecases
    var postUsecases: PostUsecases
    var platformUsecases: PlatformUsecases
    
    var body: some View {
        if isLogged {
            TabView {
                AppView(categoryUsecases: self.categoryUsecases, postUsecases: self.postUsecases, platformUsecases: self.platformUsecases, categories: $categories, posts: $posts)
                    .tabItem {
                        Image(systemName: "list.dash")
                        Text("Posts")
                    }
                
                ProfileView(isLogged: $isLogged)
                    .tabItem {
                        Image(systemName: "person")
                        Text("Profile")
                    }
            }
        } else {
            swift_utils.LoadingView(isShowing: $isLoading) {
                LoginView(isLogged: $isLogged, isLoading: $isLoading, userUsecases: self.userUsecases, platformUsecases: self.platformUsecases)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(isLogged: false, isLoading: false, posts: [], categories: [], userUsecases: UserUsecases(userRepository: UserRepository(api: Api())),
                    categoryUsecases: CategoryUsecases(categoryRepository: CategoryRepository(api: Api())),
                    postUsecases: PostUsecases(postRepository: PostRepository(api: Api())),
                    platformUsecases: PlatformUsecases(config: Config()))
    }
}
