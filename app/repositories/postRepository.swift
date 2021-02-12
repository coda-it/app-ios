//
//  postRepository.swift
//  app
//
//  Created by Oskar on 12/02/2021.
//

struct PostRepository {
    let api: Api
    
    func fetchPosts(apiAddress: String, completion: @escaping (Array<PostModel>) -> ()) {
        self.api.get(url: "\(apiAddress)/api/posts",
                     completion: completion)
    }
}
