//
//  PostView.swift
//  app
//
//  Created by Oskar on 15/02/2021.
//

import SwiftUI

struct PostDetail: View {
    let post: PostModel
    
    var body: some View {
        VStack {
            Text(post.description)
            
            Spacer()
        }.navigationBarTitle(Text(post.title), displayMode: .inline)
    }
}
