//
//  AppView.swift
//  app
//
//  Created by Oskar on 08/02/2021.
//

import SwiftUI

struct AppView: View {
    var categoryUsecases: CategoryUsecases
    var postUsecases: PostUsecases
    var platformUsecases: PlatformUsecases
    @Binding var categories: Array<CategoryModel>
    @Binding var posts: Array<PostModel>
    
    var body: some View {
        TabView {
            VStack(alignment: .leading) {
                NavigationView {
                    List(categories, id:\.self.id) { category in
                        NavigationLink(destination: CategoryDetail(category: category, posts: posts)) {
                            Image(category.image).cornerRadius(4.0)
                        }
                    }
                }
            }
        }.onAppear {
            self.fetchCategories(apiAddress: platformUsecases.getAPIAddress())
            self.fetchPosts(apiAddress: platformUsecases.getAPIAddress())
        }
    }
    
    func fetchCategories (apiAddress: String) {
        self.categoryUsecases.getAllCategories(apiAddress: apiAddress, completion: { categories in
            self.categories = categories
        })
    }
    
    func fetchPosts (apiAddress: String) {
        self.postUsecases.getAllPosts(apiAddress: apiAddress, completion: { posts in
            self.posts = posts
        })
    }
}

struct AppView_Previews: PreviewProvider {
    @State(initialValue: []) static var posts: Array<PostModel>
    @State(initialValue: []) static var categories: Array<CategoryModel>
    
    static var previews: some View {
        AppView(
            categoryUsecases: CategoryUsecases(categoryRepository: CategoryRepository(api: Api())),
            postUsecases: PostUsecases(postRepository: PostRepository(api: Api())),
            platformUsecases: PlatformUsecases(config: Config()),
            categories: $categories,
            posts: $posts
        )
    }
}
