//
//  postModel.swift
//  app
//
//  Created by Oskar on 12/02/2021.
//

struct PostModel: Codable {
    var id: String
    var userId: String
    var categoryId: String
    var title: String
    var description: String
    var image: String
}

struct PostsEmbedded: Codable {
    var posts: Array<PostModel>
}

struct PostsResponse: Codable {
    var _embedded: PostsEmbedded
}
