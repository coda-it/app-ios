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
    
    var userUsecases: UserUsecases
    var postUsecases: PostUsecases
    var platformUsecases: PlatformUsecases
    
    var body: some View {
        if isLogged {
            TabView {
                AppView(postUsecases: self.postUsecases, platformUsecases: self.platformUsecases, posts: $posts)
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
        ContentView(isLogged: false, isLoading: false, posts: [], userUsecases: UserUsecases(userRepository: UserRepository(api: Api())),
                    postUsecases: PostUsecases(postRepository: PostRepository(api: Api())),
                    platformUsecases: PlatformUsecases(config: Config()))
    }
}
