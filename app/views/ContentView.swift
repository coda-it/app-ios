//
//  ContentView.swift
//  app
//
//  Created by Oskar on 07/02/2021.
//

import SwiftUI

struct ContentView: View {
    @State var isLogged = false
    @State var isLoading = false

    var userUsecases: UserUsecases
    var settings = UserSettings()
    
    var body: some View {
        if isLogged {
            TabView {
                AppView()
                    .tabItem {
                        Image(systemName: "list.dash")
                        Text("Posts")
                    }
                
                ProfileView(isLogged: $isLogged)
                    .tabItem {
                        Image(systemName: "person")
                        Text("Profile")
                    }
            }.environmentObject(settings)
        } else {
            LoadingView(isShowing: $isLoading) {
                LoginView(isLogged: $isLogged, isLoading: $isLoading, userUsecases: self.userUsecases).environmentObject(settings)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(isLogged: false, isLoading: false, userUsecases: UserUsecases(userRepository: UserRepository(api: Api())))
    }
}
