//
//  File.swift
//  app
//
//  Created by Oskar on 12/02/2021.
//

struct PostUsecases {
    let postRepository: PostRepository
    
    func getAllPosts(apiAddress: String, completion: @escaping (Array<PostModel>) -> ()) {
        self.postRepository.fetchPosts(apiAddress: apiAddress, completion: completion)
    }
}
