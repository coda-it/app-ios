//
//  ProfileView.swift
//  app
//
//  Created by Oskar on 08/02/2021.
//

import SwiftUI

struct ProfileView: View {
    @Binding var isLogged: Bool
    
    var body: some View {
        VStack {
            Button("Request Permission") {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("All set!")
                    } else if let error = error {
                        print(error.localizedDescription)
                    }
                }
            }
            Button("Schedule Notification") {
                let content = UNMutableNotificationContent()
                content.title = "Home Alert"
                content.subtitle = "intruder detected"
                content.sound = UNNotificationSound.default
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                
                UNUserNotificationCenter.current().add(request)
            }
            Button(action: {
                self.isLogged = false
            }) {
                Text("Logout")
            }.font(.headline)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(isLogged: .constant(false))
    }
}
