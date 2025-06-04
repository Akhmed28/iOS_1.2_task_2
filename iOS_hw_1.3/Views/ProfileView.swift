import SwiftUI
import Foundation

struct ProfileView: View {
    @EnvironmentObject var session: UserSession

    var body: some View {
        VStack {
            if let user = session.currentUser {
                Text("Last Homework: \(user.todos.last?.title ?? "None")")
                Text("Welcome, \(user.firstName)")
                Button("Logout") {
                    session.logout()
                }
            }
        }
    }
}
