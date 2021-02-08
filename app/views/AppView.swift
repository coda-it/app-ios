//
//  AppView.swift
//  app
//
//  Created by Oskar on 08/02/2021.
//

import SwiftUI

struct AppView: View {
    @EnvironmentObject var settings: UserSettings
    
    var body: some View {
        TabView {
            VStack(alignment: .leading) {
            }
        }
    }
}

struct AppView_Previews: PreviewProvider {
        static var previews: some View {
        AppView()
    }
}
