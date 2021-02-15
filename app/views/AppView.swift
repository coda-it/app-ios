//
//  AppView.swift
//  app
//
//  Created by Oskar on 08/02/2021.
//

import SwiftUI

struct AppView: View {
    var postUsecases: PostUsecases
    @Binding var posts: Array<PostModel>
    @EnvironmentObject var settings: UserSettings
    
    var body: some View {
        TabView {
            VStack(alignment: .leading) {
                NavigationView {
                    List(posts, id:\.self.id) { post in
                        NavigationLink(destination: PostDetail(post: post)) {
                            Text(post.title)
                        }
                    }
                }
            }
        }.onAppear {
            self.fetchPosts(apiAddress: settings.apiAddress)
        }
    }
    
    func fetchPosts (apiAddress: String) {
        self.postUsecases.getAllPosts(apiAddress: apiAddress, completion: { posts in
            self.posts = posts
        })
    }
}

struct AppView_Previews: PreviewProvider {
    @State(initialValue: []) static var posts: Array<PostModel>
    
    static var previews: some View {
        AppView(postUsecases: PostUsecases(postRepository: PostRepository(api: Api())), posts: $posts)
    }
}
