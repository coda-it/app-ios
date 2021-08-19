//
//  CategoryView.swift
//  app
//
//  Created by Oskar on 19/08/2021.
//

import SwiftUI

struct CategoryDetail: View {
    let category: CategoryModel
    let posts: Array<PostModel>
    
    var body: some View {
        VStack {
            NavigationView {
                List(posts, id:\.self.id) { post in
                    NavigationLink(destination: PostDetail(post: post)) {
                        Text(post.title)
                    }
                }
            }
        }.navigationBarTitle(Text(category.name), displayMode: .inline)
    }
}

