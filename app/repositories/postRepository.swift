//
//  postRepository.swift
//  app
//
//  Created by Oskar on 12/02/2021.
//
struct Embedded: Codable {
    var posts: Array<PostModel>
}
struct PostsResponse: Codable {
    var _embedded: Embedded
}

struct PostRepository {
    let api: Api
    
    func fetchPosts(apiAddress: String, completion: @escaping (Array<PostModel>) -> ()) {
        self.api.get(url: "\(apiAddress)/api/post", type: PostsResponse.self,
                     completion: { (data: PostsResponse?) in
                        completion(data?._embedded.posts ?? [])
                     })
    }
}
